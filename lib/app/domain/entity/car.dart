class Car {
  Car({ this.uid, this.name, this.odo, this.imageUrl });

  final String uid;
  final String name;
  final int odo;
  final String imageUrl;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'odo': this.odo,
      'imageUrl': this.imageUrl,
    };
  }
}