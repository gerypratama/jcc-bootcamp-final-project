class ActivityIdea {
  ActivityIdea({
    this.activity,
    this.type,
    this.participants,
  });

  String? activity;
  String? type;
  int? participants;

  factory ActivityIdea.fromJson(Map<String, dynamic> json) => ActivityIdea(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
      );
}
