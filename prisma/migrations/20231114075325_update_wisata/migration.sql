/*
  Warnings:

  - You are about to drop the column `fasilitasId` on the `wisatas` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "wisatas" DROP CONSTRAINT "wisatas_fasilitasId_fkey";

-- AlterTable
ALTER TABLE "fasilitas" ADD COLUMN     "wisataId" INTEGER;

-- AlterTable
ALTER TABLE "wisatas" DROP COLUMN "fasilitasId";

-- AddForeignKey
ALTER TABLE "fasilitas" ADD CONSTRAINT "fasilitas_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisatas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
