{ hw, pNixos, ... }:
{
  imports = [
    hw.common-pc
    hw.common-pc-laptop-ssd
    hw.common-pc-laptop-acpi_call
    hw.common-cpu-amd-pstate
    hw.common-gpu-nvidia-sync
  ] ++ builtins.map pNixos [

  ];
}
