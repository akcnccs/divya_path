class Message {
  final String id;
  final String role; // 'user' | 'model'
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
  });
}

class PanchangData {
  final String tithi;
  final String tithiMeaning;
  final String nakshatra;
  final String nakshatraDeity;
  final String sunrise;
  final String sunset;
  final String moonPhase;
  final String moonPhaseIcon;
  final List<Muhurat> muhurat;
  final String festival;
  final String? festivalStory;
  final String rahuKaal;
  final String amritKaal;

  PanchangData({
    required this.tithi,
    required this.tithiMeaning,
    required this.nakshatra,
    required this.nakshatraDeity,
    required this.sunrise,
    required this.sunset,
    required this.moonPhase,
    required this.moonPhaseIcon,
    required this.muhurat,
    required this.festival,
    this.festivalStory,
    required this.rahuKaal,
    required this.amritKaal,
  });
}

class Muhurat {
  final String name;
  final String time;
  final String type; // 'auspicious' | 'inauspicious'

  Muhurat({
    required this.name,
    required this.time,
    required this.type,
  });
}

class BhajanItem {
  final String id;
  final String title;
  final String category;
  final String artist;
  final String duration;
  final String coverUrl;
  final String audioUrl;
  final String lyrics;
  final String translation;
  final String meaning;
  final int favoritesCount;
  final bool isFavorite;
  final bool isDownloaded;

  BhajanItem({
    required this.id,
    required this.title,
    required this.category,
    required this.artist,
    required this.duration,
    required this.coverUrl,
    required this.audioUrl,
    required this.lyrics,
    required this.translation,
    required this.meaning,
    required this.favoritesCount,
    this.isFavorite = false,
    this.isDownloaded = false,
  });
}

class Temple {
  final String id;
  final String name;
  final String location;
  final Coordinates coordinates;
  final String history;
  final String openingHours;
  final List<String> galleryUrls;
  final List<String> festivals;
  final String? liveDarshanStream;
  final bool hasPoojaBooking;
  final bool hasPrasadBooking;
  final List<Pooja> poojas;
  final List<SevaOption> sevaOptions;
  final List<Review> reviews;

  Temple({
    required this.id,
    required this.name,
    required this.location,
    required this.coordinates,
    required this.history,
    required this.openingHours,
    required this.galleryUrls,
    required this.festivals,
    this.liveDarshanStream,
    required this.hasPoojaBooking,
    required this.hasPrasadBooking,
    required this.poojas,
    required this.sevaOptions,
    required this.reviews,
  });
}

class Coordinates {
  final double lat;
  final double lng;
  Coordinates({required this.lat, required this.lng});
}

class Pooja {
  final String id;
  final String name;
  final double price;
  final String description;
  Pooja({required this.id, required this.name, required this.price, required this.description});
}

class SevaOption {
  final String id;
  final String name;
  final double price;
  final String description;
  SevaOption({required this.id, required this.name, required this.price, required this.description});
}

class Review {
  final String user;
  final double rating;
  final String text;
  final String date;
  Review({required this.user, required this.rating, required this.text, required this.date});
}

class UserProfile {
  final String name;
  final String email;
  final String avatar;
  final int meditationStreak;
  final int longestStreak;
  final int totalChantsCount;
  final int meditationMinutes;
  final String membershipType; // 'Free' | 'Gold'

  UserProfile({
    required this.name,
    required this.email,
    required this.avatar,
    required this.meditationStreak,
    required this.longestStreak,
    required this.totalChantsCount,
    required this.meditationMinutes,
    required this.membershipType,
  });
}
