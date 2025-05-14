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
      nvidiaBusId = "";
      amdgpuBusId = "";
    };
  };
  services.hdapsd.enable = true;
}
