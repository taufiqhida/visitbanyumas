const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports = {
  admin: prisma.admin,
  ulasan: prisma.ulasan,
  kecamatan: prisma.kecamatan,
  imageWisata: prisma.imageWisata,
  imageHotel: prisma.imageHotel,
  fasilitasHotel: prisma.fasilitasHotel,
  fasilitasWisata: prisma.fasilitasWisata,
  fasilitasHotelImage: prisma.fasilitasHotelImage,
  fasilitasWisataImage: prisma.fasilitasWisataImage,
  hotel: prisma.hotel,
  wisata: prisma.wisata,
  wisataHasHotel: prisma.wisataHasHotel,
};
