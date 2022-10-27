const express = require("express");
const Textbook = require("./textbook");

const textRouter = express.Router();

textRouter.post("/api/catalog", async (req, res) => {
  try {
    const { name, condition, class: String, university, description } = req.body;

    let textbook = new Textbook({
      name,
      condition,
      class: String,
      university,
      description,
    });
    textbook = await textbook.save();
    res.json(textbook);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = textRouter;