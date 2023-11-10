-- CreateTable
CREATE TABLE "Ulasan" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "tempat" TEXT NOT NULL,
    "ulasan" TEXT NOT NULL,

    CONSTRAINT "Ulasan_pkey" PRIMARY KEY ("id")
);
