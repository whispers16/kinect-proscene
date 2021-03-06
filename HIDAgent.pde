public class HIDAgent extends Agent {
  float [] sens = {4, 4, 7, 0, 5, 5};
  
  public HIDAgent(Scene scn) {
    super(scn.inputHandler());
    SN_ID = MotionShortcut.registerID(6, "SN_SENSOR");
    addGrabber(mainScene.eyeFrame());
    setDefaultGrabber(mainScene.eyeFrame());
  }
  
  // we need to override the agent sensitivities method for the agent
  // to apply them to the input data gathered from the sliders
  @Override
  public float[] sensitivities(MotionEvent event) {
    if (event instanceof DOF6Event)
      return sens;
    else
      return super.sensitivities(event);
  }
  
  // polling is done by overriding the feed agent method
  // note that we pass the id of the gesture
  @Override
  public DOF6Event feed() {
    return new DOF6Event(defaultXPosition, defaultYPosition, defaultZPosition, 0, defaultYRotate, defaultZRotate, BogusEvent.NO_MODIFIER_MASK, SN_ID);
  }
  
  public float[] getSens(){
    return this.sens; 
  }

  public void setSens(float[] sens){
    this.sens = sens;
  }

}