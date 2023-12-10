-- CreateTable
CREATE TABLE "admins" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admins_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ulasan" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "tempat" TEXT NOT NULL,
    "ulasan" TEXT NOT NULL,

    CONSTRAINT "ulasan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kecamatan" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "kecamatan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "image_wisata" (
    "id" SERIAL NOT NULL,
    "idImagekit" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "url" TEXT NOT NULL,
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
CREATE TABLE "fasilitas_hotel" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "jumlah" INTEGER NOT NULL,
    "hotelId" INTEGER,

    CONSTRAINT "fasilitas_hotel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fasilitas_wisata" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "jumlah" INTEGER NOT NULL,
    "wisataId" INTEGER,

    CONSTRAINT "fasilitas_wisata_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fasilitas_hotel_image" (
    "id" SERIAL NOT NULL,
    "idImagekit" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "fasilitasHotelId" INTEGER,

    CONSTRAINT "fasilitas_hotel_image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fasilitas_wisata_image" (
    "id" SERIAL NOT NULL,
    "idImagekit" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "fasilitasWisataId" INTEGER,

    CONSTRAINT "fasilitas_wisata_image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hotel" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "linkmap" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "nohp" BIGINT NOT NULL,
    "harga_min" BIGINT NOT NULL,
    "harga_max" BIGINT NOT NULL,
    "isPopular" BOOLEAN NOT NULL,
    "jarak" INTEGER NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "check_in" TEXT NOT NULL,
    "check_out" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "kecamatanId" INTEGER NOT NULL,

    CONSTRAINT "hotel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wisata" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "linkmap" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "nohp" BIGINT NOT NULL,
    "harga_min" BIGINT NOT NULL,
    "harga_max" BIGINT NOT NULL,
    "jarak" INTEGER NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "jam_buka" TEXT NOT NULL,
    "jam_tutup" TEXT NOT NULL,
    "isPopular" BOOLEAN NOT NULL,
    "kecamatanId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "wisata_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WisataHasHotel" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "WisataHasHotel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_HotelToWisataHasHotel" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_WisataToWisataHasHotel" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "admins_username_key" ON "admins"("username");

-- CreateIndex
CREATE UNIQUE INDEX "kecamatan_slug_key" ON "kecamatan"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "image_wisata_idImagekit_key" ON "image_wisata"("idImagekit");

-- CreateIndex
CREATE UNIQUE INDEX "image_hotel_idImagekit_key" ON "image_hotel"("idImagekit");

-- CreateIndex
CREATE UNIQUE INDEX "fasilitas_hotel_image_idImagekit_key" ON "fasilitas_hotel_image"("idImagekit");

-- CreateIndex
CREATE UNIQUE INDEX "fasilitas_wisata_image_idImagekit_key" ON "fasilitas_wisata_image"("idImagekit");

-- CreateIndex
CREATE UNIQUE INDEX "hotel_slug_key" ON "hotel"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "wisata_slug_key" ON "wisata"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "_HotelToWisataHasHotel_AB_unique" ON "_HotelToWisataHasHotel"("A", "B");

-- CreateIndex
CREATE INDEX "_HotelToWisataHasHotel_B_index" ON "_HotelToWisataHasHotel"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_WisataToWisataHasHotel_AB_unique" ON "_WisataToWisataHasHotel"("A", "B");

-- CreateIndex
CREATE INDEX "_WisataToWisataHasHotel_B_index" ON "_WisataToWisataHasHotel"("B");

-- AddForeignKey
ALTER TABLE "image_wisata" ADD CONSTRAINT "image_wisata_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisata"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image_hotel" ADD CONSTRAINT "image_hotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fasilitas_hotel" ADD CONSTRAINT "fasilitas_hotel_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES "hotel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fasilitas_wisata" ADD CONSTRAINT "fasilitas_wisata_wisataId_fkey" FOREIGN KEY ("wisataId") REFERENCES "wisata"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fasilitas_hotel_image" ADD CONSTRAINT "fasilitas_hotel_image_fasilitasHotelId_fkey" FOREIGN KEY ("fasilitasHotelId") REFERENCES "fasilitas_hotel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fasilitas_wisata_image" ADD CONSTRAINT "fasilitas_wisata_image_fasilitasWisataId_fkey" FOREIGN KEY ("fasilitasWisataId") REFERENCES "fasilitas_wisata"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hotel" ADD CONSTRAINT "hotel_kecamatanId_fkey" FOREIGN KEY ("kecamatanId") REFERENCES "kecamatan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wisata" ADD CONSTRAINT "wisata_kecamatanId_fkey" FOREIGN KEY ("kecamatanId") REFERENCES "kecamatan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HotelToWisataHasHotel" ADD CONSTRAINT "_HotelToWisataHasHotel_A_fkey" FOREIGN KEY ("A") REFERENCES "hotel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HotelToWisataHasHotel" ADD CONSTRAINT "_HotelToWisataHasHotel_B_fkey" FOREIGN KEY ("B") REFERENCES "WisataHasHotel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_WisataToWisataHasHotel" ADD CONSTRAINT "_WisataToWisataHasHotel_A_fkey" FOREIGN KEY ("A") REFERENCES "wisata"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_WisataToWisataHasHotel" ADD CONSTRAINT "_WisataToWisataHasHotel_B_fkey" FOREIGN KEY ("B") REFERENCES "WisataHasHotel"("id") ON DELETE CASCADE ON UPDATE CASCADE;
