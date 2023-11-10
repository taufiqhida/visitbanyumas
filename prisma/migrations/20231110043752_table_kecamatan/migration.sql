-- CreateTable
CREATE TABLE "Kecamatan" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,

    CONSTRAINT "Kecamatan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fasilitas" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "jumlah" INTEGER NOT NULL,

    CONSTRAINT "Fasilitas_pkey" PRIMARY KEY ("id")
);
