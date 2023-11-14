/*
  Warnings:

  - You are about to drop the column `fasilitasId` on the `hotels` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "hotels" DROP CONSTRAINT "hotels_fasilitasId_fkey";

-- AlterTable
ALTER TABLE "fasilitas" ADD COLUMN     "hotelId" INTEGER;

-- AlterTable
ALTER TABLE "hotels" DROP COLUMN "fasilitasId";

-- AddForeignKey
ALTER TABLE "fasilitas" ADD CONSTRAINT "fasilitas_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotels"("id") ON DELETE SET NULL ON UPDATE CASCADE;
