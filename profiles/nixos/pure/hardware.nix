{config, ...}: {
  boot = {
    kernelParams = ["amd_pstate=active"];
    blacklistedKernelModules = ["k10temp"];
    extraModulePackages = [config.boot.kernelPackages.zenpower];
    kernelModules = ["zenpower"];
  };
  hardware = {
    amdgpu.initrd.enable = true;
    cpu.amd.updateMicrocode = true;
    nvidia.prime = {
      nvidiaBusId = "PCI:0:1:0";
      amdgpuBusId = "PCI:0:74:0";
    };
  };
  services.hdapsd.enable = true;
}
