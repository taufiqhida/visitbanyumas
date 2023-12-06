const { kecamatan } = require("../models"),
  utils = require("../utils");

module.exports = {
  getAll: async (req, res, next) => {
    try {
      const data = await kecamatan.findMany();

      return res.status(200).json(data);
    } catch (error) {
      next(error);
    }
  },
  create: async (req, res, next) => {
    try {
      const { nama } = req.body;
      const nameSlug = await utils.createSlug(nama);
      const data = await kecamatan.create({
        data: {
          nama: nama,
          slug: nameSlug,
        },
      });

      return res.status(201).json({
        data: data,
      });
    } catch (error) {
      next(error);
    }
  },
  getKecamatan: async (req, res, next) => {
    try {
      const data = await kecamatan.findFirst({
        where: {
          id: parseInt(req.params.id),
        },
      });
      return res.status(200).json(data);
    } catch (error) {
      next(error);
    }
  },
  update: async (req, res, next) => {
    try {
      const namaSlug = await utils.createSlug(req.body.slug);
      const data = await kecamatan.update({
        where: {
          id: parseInt(req.params.id),
        },
        data: {
          nama: req.body.nama,
          slug: namaSlug,
        },
      });

      return res.status(200).json({
        data,
      });
    } catch (error) {
      next(error);
    }
  },
  destroy: async (req, res, next) => {
    try {
      const hpsKecamatan = await kecamatan.delete({
        where: {
          id: parseInt(req.params.id),
        },
      });

      return res.status(200).json("Data kecamatan berhasil di hps");
    } catch (error) {
      return next(error);
    }
  },
};
