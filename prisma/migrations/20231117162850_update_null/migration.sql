/*
  Warnings:

  - You are about to drop the column `idHotel` on the `images` table. All the data in the column will be lost.
  - You are about to drop the column `idWisata` on the `images` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "images" DROP CONSTRAINT "images_idHotel_fkey";

-- DropForeignKey
ALTER TABLE "images" DROP CONSTRAINT "images_idWisata_fkey";

-- DropForeignKey
ALTER TABLE "wisata_has_hotel" DROP CONSTRAINT "wisata_has_hotel_hotelId_fkey";

-- DropForeignKey
ALTER TABLE "wisata_has_hotel" DROP CONSTRAINT "wisata_has_hotel_wisataId_fkey";

-- AlterTable
ALTER TABLE "images" DROP COLUMN "idHotel",
DROP COLUMN "idWisata",
ADD COLUMN     "hotelId" INTEGER,
ADD COLUMN     "wisataId" INTEGER;

-- AlterTable
ALTER TABLE "wisata_has_hotel" ALTER COLUMN "hotelId" DROP NOT NULL,
ALTER COLUMN "wisataId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata_has_hotel" ADD CONSTRAINT "wisata_has_hotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata_has_hotel" ADD CONSTRAINT "wisata_has_hotel_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
