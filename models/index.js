const {PrismaClient} = require('@prisma/client')

const prisma = new PrismaClient();

module.exports={
    admin : prisma.admin,
    ulasan : prisma.ulasan,
    kecamatan : prisma.kecamatan,
    image : prisma.image,
    fasilitas : prisma.fasilitas,
    hotel : prisma.hotel,
    wisata : prisma.wisata,
    wisataHasHotel : prisma.wisata_has_hotel
}