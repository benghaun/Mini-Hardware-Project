<?xml version="1.0" encoding="UTF-8"?>
<project name="MiniHardwareProject" board="Mojo V3" language="Lucid">
  <files>
    <src>AdderInput.luc</src>
    <src>1bitAdder.luc</src>
    <src top="true">mojo_top.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>custom.ucf</ucf>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
