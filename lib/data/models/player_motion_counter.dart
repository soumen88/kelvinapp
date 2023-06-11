class PlayerMotionCounter{
  int leftAxisMotion;
  int rightAxisMotion;
  int upAxisMotion;
  int downAxisMotion;

  PlayerMotionCounter(
      {
        required this.leftAxisMotion,
        required this.rightAxisMotion,
        required this.upAxisMotion,
        required this.downAxisMotion
      });

  @override
  String toString() {
    return 'PlayerMotionCounter{leftAxisMotion: $leftAxisMotion, rightAxisMotion: $rightAxisMotion, upAxisMotion: $upAxisMotion, downAxisMotion: $downAxisMotion}';
  }
}