class House {
  final String title;
  final String location;
  final String image;

  const House({
    required this.title,
    required this.location,
    required this.image,
  });
}

const List<House> houses = [
  House(
    title: "Ocean View Villa",
    location: "Banana Island, Lagos",
    image:
        "https://images.unsplash.com/photo-1613977257363-707ba9348227?w=1200",
  ),
  House(
    title: "Modern Duplex",
    location: "Lekki Phase 1",
    image:
        "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1200",
  ),
  House(
    title: "Luxury Mansion",
    location: "Ikoyi, Lagos",
    image:
        "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=1200",
  ),
  House(
    title: "Palm Residence",
    location: "Victoria Island",
    image:
        "https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?w=1200",
  ),
];
