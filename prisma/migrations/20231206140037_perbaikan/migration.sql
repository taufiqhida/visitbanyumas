/*
  Warnings:

  - You are about to drop the `images` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `wisata_has_hotel` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `check_in` to the `hotels` table without a default value. This is not possible if the table is not empty.
  - Added the required column `check_out` to the `hotels` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isPopular` to the `hotels` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rating` to the `hotels` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `nohp` on the `hotels` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `isPopular` to the `wisatas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jam_buka` to the `wisatas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jam_tutup` to the `wisatas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rating` to the `wisatas` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `nohp` on the `wisatas` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "hotels" ADD COLUMN     "check_in" TEXT NOT NULL,
ADD COLUMN     "check_out" TEXT NOT NULL,
ADD COLUMN     "isPopular" BOOLEAN NOT NULL,
ADD COLUMN     "rating" DOUBLE PRECISION NOT NULL,
DROP COLUMN "nohp",
ADD COLUMN     "nohp" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "wisatas" ADD COLUMN     "isPopular" BOOLEAN NOT NULL,
ADD COLUMN     "jam_buka" TEXT NOT NULL,
ADD COLUMN     "jam_tutup" TEXT NOT NULL,
ADD COLUMN     "rating" DOUBLE PRECISION NOT NULL,
DROP COLUMN "nohp",
ADD COLUMN     "nohp" BIGINT NOT NULL;

-- DropTable
DROP TABLE "images";

-- DropTable
DROP TABLE "wisata_has_hotel";

-- CreateTable
CREATE TABLE "image_wisata" (
    "id" SERIAL NOT NULL,
    "idImagekit" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "hotelId" INTEGER,
    "wisataId" INTEGER,

    CONSTRAINT "image_wisata_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "image_hotel" (
    "id" SERIAL NOT NULL,
    "idImagekit" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "hotelId" INTEGER,

    CONSTRAINT "image_hotel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "image_fasilitas" (
    "id" SERIAL NOT NULL,
    "idImagekit" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "fasilitasId" INTEGER,

    CONSTRAINT "image_fasilitas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wisataHasHotel" (
    "id" SERIAL NOT NULL,
    "wisataId" INTEGER,
    "hotelId" INTEGER,

    CONSTRAINT "wisataHasHotel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "image_wisata_idImagekit_key" ON "image_wisata"("idImagekit");

-- CreateIndex
CREATE UNIQUE INDEX "image_hotel_idImagekit_key" ON "image_hotel"("idImagekit");

-- CreateIndex
CREATE UNIQUE INDEX "image_fasilitas_idImagekit_key" ON "image_fasilitas"("idImagekit");

-- AddForeignKey
ALTER TABLE "image_wisata" ADD CONSTRAINT "image_wisata_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image_wisata" ADD CONSTRAINT "image_wisata_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image_hotel" ADD CONSTRAINT "image_hotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image_fasilitas" ADD CONSTRAINT "image_fasilitas_fasilitasId_fkey" FOREIGN KEY ("fasilitasId") REFERENCES "fasilitas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisataHasHotel" ADD CONSTRAINT "wisataHasHotel_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisataHasHotel" ADD CONSTRAINT "wisataHasHotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;
