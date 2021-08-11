class Spacings {
  final double xs;
  final double s;
  final double m;
  final double l;

  const Spacings({
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
  });

  const Spacings.defaulted()
      : xs = 2,
        s = 4,
        m = 8,
        l = 24;
}
