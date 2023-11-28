/*
  Warnings:

  - A unique constraint covering the columns `[slug]` on the table `hotels` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[slug]` on the table `kecamatans` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[slug]` on the table `wisatas` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "hotels_slug_key" ON "hotels"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "kecamatans_slug_key" ON "kecamatans"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "wisatas_slug_key" ON "wisatas"("slug");
