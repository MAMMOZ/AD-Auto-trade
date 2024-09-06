const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

mongoose.connect('mongodb://clvxq1xxb0009bsmn300hbbb4:xbJxj7d5BEcq8T4rQMSPXKQZ@161.246.127.24:9061/?readPreference=primary&ssl=false', {
    useNewUrlParser: true,
    useUnifiedTopology: true
});
const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
    console.log('Connected to MongoDB');
});

const adSchema = new mongoose.Schema({
    key: String,
    bot: String,
    trade: Number,
    status: Number
});
const Ad = mongoose.model('Ad', adSchema);

const logSchema = new mongoose.Schema({
    key: String,
    bot: String,
    mammoz: String,
    gem: Number,
    rr: Number,
    status: Number
});
const Log = mongoose.model('Log', logSchema);

app.use(bodyParser.json());

// Routes
// AD endpoint
// Check AD (BOT)
app.post('/check', async (req, res) => {
    try {
        const { key, bot } = req.body;
        const adData = await Ad.findOne({ key: key, bot: bot });
        if (!adData) {
            return res.status(404).json({ message: 'No data found' });
        }
        const statusZero = await Ad.findOne({ status: 0, trade: { $ne: 0 } });
        res.status(200).json(statusZero);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});
// ADD AD (SERVER)
app.post('/addmammoz', async (req, res) => {
    try {
        const { key, bot, trade, status } = req.body;
        const newLog = new Ad({ key, bot, trade, status });
        await newLog.save();
        res.status(200).json(newLog);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
});
// UPDATE AD (SERVER)
app.post('/updatemammoz', async (req, res) => {
    try {
        const { key, bot, trade, status } = req.body;
        const updatedAd = await Ad.findOneAndUpdate(
            { key: key },
            { bot: bot, trade: trade, status: status },
            { new: true }
        );
        if (!updatedAd) {
            return res.status(404).json({ message: 'Ad not found' });
        }
        res.status(200).json(updatedAd);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
});

// Routes
// Trade endpoint
// Get Trade (SERVER)
app.post('/trade', async (req, res) => {
    try {
        const { key, mammoz } = req.body;
        const adData = await Log.findOne({ key: key, mammoz: mammoz });
        if (!adData) {
            return res.status(404).json({ message: 'No data found' });
        }
        const statusZero = await Log.findOne({ status: 0});
        res.status(200).json(statusZero);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});
// ADD Trade (BOT)
app.post('/addtrade', async (req, res) => {
  try {
        const { key, bot, mammoz, gem, rr, status } = req.body;
        console.log(key, bot, mammoz, gem, rr, status);
        const checksame = await Ad.findOne({mammoz: bot})
        if (checksame) return res.status(404).json({ message: 'Ad Same Mammoz' });
        const adData = await Log.findOne({ key: key, bot: bot, mammoz: mammoz, status: status });
        if (!adData) {
            return res.status(404).json({ message: 'No data found' });
        }
        const newLog = new Log({ key, bot, mammoz, gem, rr, status });
        await newLog.save();
        res.status(200).json(newLog);
  } catch (error) {
        res.status(400).json({ message: error.message });
  }
});
// UPDATE Trade (Server)
app.post('/updatetrade', async (req, res) => {
    try {
        const { key, bot, status } = req.body;
        const updatedAd = await Log.findOneAndUpdate(
            { key: key },
            { bot: bot, status: status },
            { new: true }
        );
        if (!updatedAd) {
            return res.status(404).json({ message: 'Trade not found' });
        }
        res.status(200).json(updatedAd);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
});


app.get('/', async (req, res) => {
    try {
        res.status(201).json("mamoz");
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
  });
  
// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});