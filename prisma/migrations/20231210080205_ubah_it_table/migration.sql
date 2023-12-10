/*
  Warnings:

  - You are about to drop the `_HotelToWisataHasHotel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_WisataToWisataHasHotel` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_HotelToWisataHasHotel" DROP CONSTRAINT "_HotelToWisataHasHotel_A_fkey";

-- DropForeignKey
ALTER TABLE "_HotelToWisataHasHotel" DROP CONSTRAINT "_HotelToWisataHasHotel_B_fkey";

-- DropForeignKey
ALTER TABLE "_WisataToWisataHasHotel" DROP CONSTRAINT "_WisataToWisataHasHotel_A_fkey";

-- DropForeignKey
ALTER TABLE "_WisataToWisataHasHotel" DROP CONSTRAINT "_WisataToWisataHasHotel_B_fkey";

-- AlterTable
ALTER TABLE "WisataHasHotel" ADD COLUMN     "hotelId" INTEGER,
ADD COLUMN     "wisataId" INTEGER;

-- DropTable
DROP TABLE "_HotelToWisataHasHotel";

-- DropTable
DROP TABLE "_WisataToWisataHasHotel";

-- AddForeignKey
ALTER TABLE "WisataHasHotel" ADD CONSTRAINT "WisataHasHotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WisataHasHotel" ADD CONSTRAINT "WisataHasHotel_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisata"("id") ON DELETE SET NULL ON UPDATE CASCADE;
