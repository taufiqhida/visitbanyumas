/*
  Warnings:

  - You are about to alter the column `harga_min` on the `hotels` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `harga_max` on the `hotels` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `harga_min` on the `wisatas` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `harga_max` on the `wisatas` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.

*/
-- AlterTable
ALTER TABLE "hotels" ALTER COLUMN "harga_min" SET DATA TYPE INTEGER,
ALTER COLUMN "harga_max" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "wisatas" ALTER COLUMN "harga_min" SET DATA TYPE INTEGER,
ALTER COLUMN "harga_max" SET DATA TYPE INTEGER;

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata_has_hotel" ADD CONSTRAINT "wisata_has_hotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata_has_hotel" ADD CONSTRAINT "wisata_has_hotel_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
