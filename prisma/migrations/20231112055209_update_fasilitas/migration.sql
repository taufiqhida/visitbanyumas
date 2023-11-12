-- AlterTable
ALTER TABLE "hotels" ADD COLUMN     "fasilitasId" INTEGER;

-- AlterTable
ALTER TABLE "wisatas" ADD COLUMN     "fasilitasId" INTEGER;

-- AddForeignKey
ALTER TABLE "hotels" ADD CONSTRAINT "hotels_fasilitasId_fkey" FOREIGN KEY ("fasilitasId") REFERENCES "fasilitas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisatas" ADD CONSTRAINT "wisatas_fasilitasId_fkey" FOREIGN KEY ("fasilitasId") REFERENCES "fasilitas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
