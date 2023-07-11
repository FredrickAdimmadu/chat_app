

class ChatUser {
  ChatUser({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.email,
    required this.pushToken,
    required this.number,
    required this.relationship,
    required this.country,
    required this.gender,
    required this.language,
    required this.website,
    required this.followers,
    required this.following,
    required this.password,
    required this.updatePassword,
    required this.description,
    required this.file,
    required this.profImage,
    required this.postId,
    required this.postUrl,
    required this.likes,
    required this.datePublished,
    required this.commentId,
    required this.text,
    required this.caption,







  });
  late String image;
  late String about;
  late String name;
  late String createdAt;
  late bool isOnline;
  late String id;
  late String lastActive;
  late String email;
  late String pushToken;
  late String number;
  late String relationship;
  late String country;
  late String gender;
  late String language;
  late String website;
  late List followers;
  late List following;
  late String password;
  late String updatePassword;
  late String description;
  late String file;
  late String profImage;
  late String postId;
  late String postUrl;
  late String likes;
  late String datePublished;
  late String commentId;
  late String text;
  late String caption;





  ChatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    isOnline = json['is_online'] ?? '';
    id = json['id'] ?? '';
    lastActive = json['last_active'] ?? '';
    email = json['email'] ?? '';
    pushToken = json['push_token'] ?? '';

    number = json['number'] ?? '';
    relationship = json['relationship'] ?? '';
    country = json['country'] ?? '';
    gender = json['gender'] ?? '';
    language = json['language'] ?? '';
    website = json['website'] ?? '';

    followers = json['followers'] ?? '';
    following = json['following'] ?? '';

    password = json['password'] ?? '';
    updatePassword = json['password'] ?? '';

    description = json['description'] ?? '';
    file = json['file'] ?? '';
    profImage = json['profImage'] ?? '';
    postId = json['postId'] ?? '';
    postUrl = json['postUrl'] ?? '';
    likes = json['likes'] ?? '';
    datePublished = json['datePulished'] ?? '';
    commentId = json['commentId'] ?? '';
    text = json['text'] ?? '';
    caption = json['caption'] ?? '';





  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['email'] = email;
    data['push_token'] = pushToken;


    data['number'] = number;
    data['relationship'] = relationship;
    data['country'] = country;
    data['gender'] = gender;
    data['language'] = language;
    data['website'] = website;

    data['followers'] = followers;
    data['following'] = following;

    data['password'] = password;
    data['updatePassword'] = updatePassword;


    data['description'] = description;
    data['file'] = file;
    data['profImage'] = profImage;
    data['postId'] = postUrl;
    data['likes'] = likes;
    data['datePublised'] = datePublished;
    data['commentId'] = commentId;
    data['text'] = text;
    data['postUrl'] = postUrl;
    data['caption'] = caption;







    return data;
  }
}
