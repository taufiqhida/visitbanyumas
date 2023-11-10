/*
  Warnings:

  - You are about to drop the `Fasilitas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Image` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Kecamatan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ulasan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `admin` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Fasilitas";

-- DropTable
DROP TABLE "Image";

-- DropTable
DROP TABLE "Kecamatan";

-- DropTable
DROP TABLE "Ulasan";

-- DropTable
DROP TABLE "admin";

-- CreateTable
CREATE TABLE "admins" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admins_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ulasans" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "tempat" TEXT NOT NULL,
    "ulasan" TEXT NOT NULL,

    CONSTRAINT "ulasans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kecamatans" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,

    CONSTRAINT "kecamatans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "images" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "idHotel" INTEGER NOT NULL,
    "idWisata" INTEGER NOT NULL,

    CONSTRAINT "images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fasilitas" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "jumlah" INTEGER NOT NULL,

    CONSTRAINT "fasilitas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hotels" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "linkmap" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "nohp" BIGINT NOT NULL,
    "harga_min" BIGINT NOT NULL,
    "harga_max" BIGINT NOT NULL,
    "idFasilitas" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "kecamatanId" INTEGER NOT NULL,

    CONSTRAINT "hotels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wisatas" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "linkmap" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "nohp" BIGINT NOT NULL,
    "harga_min" BIGINT NOT NULL,
    "harga_max" BIGINT NOT NULL,
    "idImage" INTEGER NOT NULL,
    "idFasilitas" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "kecamatanId" INTEGER NOT NULL,
    "hotelId" INTEGER,

    CONSTRAINT "wisatas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wisata_has_hotel" (
    "id" SERIAL NOT NULL,
    "hotelId" INTEGER NOT NULL,
    "wisataId" INTEGER NOT NULL,

    CONSTRAINT "wisata_has_hotel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admins_username_key" ON "admins"("username");

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_idHotel_fkey" FOREIGN KEY ("idHotel") REFERENCES "hotels"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_idWisata_fkey" FOREIGN KEY ("idWisata") REFERENCES "wisatas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hotels" ADD CONSTRAINT "hotels_kecamatanId_fkey" FOREIGN KEY ("kecamatanId") REFERENCES "kecamatans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisatas" ADD CONSTRAINT "wisatas_kecamatanId_fkey" FOREIGN KEY ("kecamatanId") REFERENCES "kecamatans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata_has_hotel" ADD CONSTRAINT "wisata_has_hotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata_has_hotel" ADD CONSTRAINT "wisata_has_hotel_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
