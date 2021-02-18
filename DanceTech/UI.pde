class UI {
  private ControlP5 cp5;
  
  DropdownList palleteDropdown;
  Slider sensitivitySlider;
  
  UI(ControlP5 cp5) {
    this.cp5 = cp5;
    addPalleteDropdown();
    addSensitivitySlider();
    addDefaultSpeedSlider();
    addAudioSensitivitySlider();
    
  }
  
  void addPalleteDropdown() {
    DropdownList ddl = cp5.addDropdownList("pallete")
          .setPosition(20, 20);
          
    ddl.setBackgroundColor(color(190));
    ddl.setItemHeight(20);
    ddl.setBarHeight(15);
    ddl.setCaptionLabel("Pallete");
    ddl.addItem("default", 0);
    ddl.addItem("fire", 1);
    //ddl.scroll(0);
    ddl.setColorBackground(color(60));
    ddl.setColorActive(color(255, 128));
    ddl.close();
    
    palleteDropdown = ddl;
  }

  void addSensitivitySlider() {
    cp5.addSlider("sensitivity")
      .setPosition(20, 50)
      .setRange(0, 100);
  }
  
  void addDefaultSpeedSlider() {
    cp5.addSlider("defaultSpeed")
      .setPosition(20, 60)
      .setRange(0, 100);
  }
    
  void addAudioSensitivitySlider() {
    cp5.addSlider("audioSensitivity")
      .setPosition(20, 70)
      .setRange(0, 100);
  }

}
