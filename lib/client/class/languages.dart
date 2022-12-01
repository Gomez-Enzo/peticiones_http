class Languages {
  Languages({
    this.spa,
  });

  String? spa;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        spa: json["spa"] == null ? null : json["spa"],
      );

  Map<String, dynamic> toJson() => {
        "spa": spa,
      };
}
