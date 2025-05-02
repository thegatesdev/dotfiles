{ pkgs, ... }:
let
  user = "tim";
  platform = "amd";
  vfioIds = [ "" "" ]; # TODO
in {
  
  boot = {
    kernelModules = [
      "kvm-${platform}"
      "vfio_virqfd"
      "vfio_pci"
      "vfio_iommu_type1"
      "vfio"
    ];
    kernelParams = [
      "${platform}_iommu=on"
      "kvm.ignore_msrs=1"
    ];
    extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
  };

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 ${user} qemu-libvirtd -"
  ];

  environment.systempackages = with pkgs [
    looking-glass-client
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        user = "${user}"
      '';

      onBoot = "ignore";
      onShutdown = "shutdown";

      qemu = {
        package = pkgs.qemu_kvm;
	ovmf = enabled;
	verbatimConfig = ''
	  namespaces = []
	  user = "+${builtins.toString config.users.users.${user}.uid}"
	'';
      };
    };
  };
  users.users.${user}.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];
}
