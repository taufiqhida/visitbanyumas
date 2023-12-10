const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const multer = require("multer");
const { v4: uuidv4 } = require("uuid");
const imageKit = require("../utils/imageKit"); // Your ImageKit integration module
const path = require("path");
const utils = require("../utils");

const getWisataAll = async (req, res, next) => {
  let { page = 1, limit = 10 } = req.query; //menghasilkan string
  let skip = (page - 1) * limit;
  console.log(req.query);
  try {
    const allWisata = await prisma.wisata.findMany({
      take: parseInt(limit),
      skip: skip,
    });

    const resultCount = await prisma.wisata.count(); //integer jumlah total data wisata

    //generated total page
    const totalPage = Math.ceil(resultCount / limit);

    res.status(200).json({
      success: true,
      current_page: page - 0, //ini -0 merubah menjadi integer
      total_page: totalPage,
      total_data: resultCount,
      data: allWisata,
    });
  } catch (error) {
    next(error);
  }
};

const getWisataById = async (req, res, next) => {
  const wisataId = parseInt(req.params.id);
  console.log(wisataId);
  try {
    const hotel = await prisma.wisata.findUnique({
      where: { id: wisataId },
    });

    if (!hotel) {
      return res.status(404).json({ message: "Hotel not found" });
    }

    res.status(200).json(hotel);
  } catch (error) {
    next(error);
  }
};

const createWisata = async (req, res, next) => {
  console.log(req.body);
  const {
    title,
    deskripsi,
    linkmap,
    alamat,
    nohp,
    hargaMin,
    hargaMax,
    isPopular,
    jarak,
    rating,
    checkIn,
    checkOut,
  } = req.body;

  const nameSlug = await utils.createSlug(title);

  try {
    // Upload image using Multer and ImageKit
    const image = req.file;
    if (!image) {
      return res.status(400).json({ message: "Image is required" });
    }

    const strFile = image.buffer.toString("base64");
    const nameFile = uuidv4() + path.extname(image.originalname);
    const { url, fileId } = await imageKit.upload({
      fileName: nameFile,
      file: strFile,
    });

    // Create hotel with image URL and ImageKit fileId
    const newWisata = await prisma.wisata.create({
      data: {
        title: title,
        deskripsi: deskripsi,
        linkmap: linkmap,
        alamat: alamat,
        nohp: nohp,
        hargaMin: parseInt(hargaMin),
        hargaMax: parseInt(hargaMax),
        isPopular: Boolean(isPopular),
        jarak: parseInt(jarak),
        rating: parseFloat(rating),
        checkIn: checkIn,
        checkOut: checkOut,
        kecamatanId: parseInt(req.body.kecamatanId),
        slug: nameSlug,
      },
    });

    const wisataId = newWisata.id;

    const createImage = await prisma.imageWisata.create({
      data: {
        nama: nameFile,
        wisataId: wisataId,
        idImagekit: fileId,
        url: url,
      },
    });

    const responseData = {
      success: true,
      message: "Succesfully create data hotel",
      data: {
        id: newHotel.id,
        title: newHotel.title,
        deskripsi: newHotel.deskripsi,
        linkmap: newHotel.linkmap,
        alamat: newHotel.alamat,
        isPopular: newHotel.isPopular,
        jarak: newHotel.jarak,
        rating: parseFloat(newHotel.rating),
        checkIn: newHotel.checkIn,
        checkOut: newHotel.checkOut,
        nohp: String(newHotel.nohp),
        hargaMin: String(newHotel.hargaMin),
        hargaMax: String(newHotel.hargaMax),
        kecamatanId: String(newHotel.kecamatanId),
        slug: newHotel.nameSlug,
      },
    };
    res.status(201).json(responseData);
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
};

const updateWisata = async (req, res, next) => {
  const wisataId = parseInt(req.params.id);
  const {
    title,
    deskripsi,
    linkmap,
    alamat,
    nohp,
    hargaMin,
    hargaMax,
    isPopular,
    jarak,
    rating,
    checkIn,
    checkOut,
  } = req.body;

  const nameSlug = await utils.createSlug(title);

  try {
    // Upload image using Multer and ImageKit
    const image = req.file;
    if (!image) {
      return res.status(400).json({ message: "Image is required" });
    }

    const strFile = image.buffer.toString("base64");
    const nameFile = uuidv4() + path.extname(image.originalname);
    const { url, fileId } = await imageKit.upload({
      fileName: nameFile,
      file: strFile,
    });

    const updatedHotel = await prisma.wisata.update({
      where: { id: wisataId },
      data: {
        title: title,
        deskripsi: deskripsi,
        linkmap: linkmap,
        alamat: alamat,
        nohp: nohp,
        hargaMin: parseInt(hargaMin),
        hargaMax: parseInt(hargaMax),
        isPopular: isPopular,
        jarak: parseInt(jarak),
        rating: parseFloat(rating),
        checkIn: checkIn,
        checkOut: checkOut,
        kecamatanId: parseInt(req.body.kecamatanId),
        slug: nameSlug,
      },
    });

    const createImage = await prisma.imageWisata.update({
      where: { id: wisataId },
      data: {
        nama: nameFile,
        wisataId: wisataId,
        idImagekit: fileId,
        url: url,
      },
    });

    if (!updatedHotel) {
      return res.status(404).json({ message: "Hotel not found" });
    }

    const responseData = {
      success: true,
      message: "Succesfully update data hotel",
      data: {
        id: newHotel.id,
        title: newHotel.title,
        deskripsi: newHotel.deskripsi,
        linkmap: newHotel.linkmap,
        alamat: newHotel.alamat,
        isPopular: newHotel.isPopular,
        jarak: newHotel.jarak,
        rating: parseFloat(newHotel.rating),
        checkIn: newHotel.checkIn,
        checkOut: newHotel.checkOut,
        nohp: String(newHotel.nohp),
        hargaMin: String(newHotel.hargaMin),
        hargaMax: String(newHotel.hargaMax),
        kecamatanId: String(newHotel.kecamatanId),
        slug: newHotel.nameSlug,
      },
    };
    res.status(201).json(responseData);
  } catch (error) {
    next(error);
  }
};

const deleteWisata = async (req, res, next) => {
  const wisataId = parseInt(req.params.id);

  try {
    const findImage = await prisma.imageWisata.findUnique({
      where: { id: wisataId },
    });

    // Delete image from ImageKit
    const fileId = findImage.idImagekit;
    await imageKit.deleteFile(fileId);

    const deletedHotel = await prisma.wisata.delete({
      where: { id: wisataId },
    });

    const deleteImage = await prisma.imageWisata.delete({
      where: { id: wisataId },
    });

    if (!deletedHotel) {
      return res.status(404).json({ message: "Hotel not found" });
    }
    res.status(202).json({
      status: true,
      message: "Deleted data hotel sucessfully",
    });
  } catch (error) {
    next(error);
  }
};

module.exports = {
  getWisataAll,
  getWisataById,
  createWisata, // Use Multer middleware for image upload
  updateWisata,
  deleteWisata,
};
