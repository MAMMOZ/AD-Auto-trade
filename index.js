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
    map: Number,
    status: Number
});
const Ad = mongoose.model('Ad', adSchema);

const tradeSchema = new mongoose.Schema({
    key: String,
    bot: String,
    mammoz: String,
    gem: Number,
    rr: Number,
    map: Number,
    status: Number
});
const Trade = mongoose.model('Trade', tradeSchema);

const logSchema = new mongoose.Schema({
    key: String,
    bot: String,
    mammoz: String,
    gem: Number,
    rr: Number,
    map: Number,
    status: Number
});
const Log = mongoose.model('Log', logSchema);

app.use(bodyParser.json());

// // Routes
// // AD endpoint
// // Check AD (BOT)
// app.post('/check', async (req, res) => {
//     try {
//         const { key, bot } = req.body;
//         const adData = await Ad.findOne({ key: key, bot: bot });
//         if (!adData) {
//             const logCount = await Log.countDocuments({ key: key, mammoz: bot, status: 0 });
//             if (logCount > 10) {
//                 const newAd = await Ad.findOne({ 
//                     key: key, 
//                     status: 0, 
//                     trade: { $ne: 0 }, 
//                     _id: { $ne: adData._id }
//                 });
//                 return res.status(404).json(newAd);
//             }else{
//                 const statusZero = await Ad.findOne({ key:key, status: 0, trade: { $ne: 0 } });
//                 return res.status(404).json(statusZero);
//             }
//         }
//         const statusZero = await Ad.findOne({ key:key, status: 0, trade: { $ne: 0 } });
//         if (statusZero){
//             return res.status(200).json(statusZero);
//         }else{
//             const statusZero = await Ad.findOne({ key:key, bot:bot});
//             return res.status(200).json(statusZero);
//         }
//     } catch (error) {
//         res.status(500).json({ message: error.message });
//     }
// });
// ADD AD (SERVER)
app.post('/addmammoz', async (req, res) => {
    try {
        const { key, bot, trade, map, status } = req.body;
        const newLog = new Ad({ key, bot, trade, map, status });
        await newLog.save();
        res.status(200).json(newLog);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
});
// UPDATE AD (SERVER)
app.post('/updatemammoz', async (req, res) => {
    try {
        const { key, bot, trade, map, status } = req.body;
        const updatedAd = await Ad.findOneAndUpdate(
            { key: key, bot: bot },
            { trade: trade, map: map, status: status },
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

// DELE AD (SERVER) เสร็จ
app.post('/delemammoz', async (req, res) => {
    try {
        const { key, bot } = req.body;
        const deletedTrade = await Ad.findOneAndDelete({ key: key, bot: bot });
        if (deletedTrade) {
            res.status(200).json({ message: 'Trade deleted successfully', data: deletedTrade });
        } else {
            res.status(404).json({ message: 'Trade not found for the provided key and bot' });
        }
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
});

// // Routes
// // Trade endpoint
// // Get Trade (SERVER)
// app.post('/trade', async (req, res) => {
//     try {
//         const { key, mammoz } = req.body;
//         const adData = await Log.findOne({ key: key, mammoz: mammoz });
//         if (!adData) {
//             return res.status(404).json({ message: 'No data found' });
//         }
//         const statusZero = await Log.findOne({ status: 0});
//         res.status(200).json(statusZero);
//     } catch (error) {
//         res.status(500).json({ message: error.message });
//     }
// });


// Check Bot, Trade Go FUNCH
app.post('/check', async (req, res) => {
    try {
        const { key, bot } = req.body;
        const checktrade = await Ad.findOne({ key: key, bot: bot });
        if (checktrade) {
            res.status(200).json({"data": checktrade, "goto": "Mammoz"});
        }else{
            const checkBot = await Trade.findOne({ key: key, bot: bot });
            if (checkBot){
                res.status(200).json({"data": checkBot, "goto": "Bot Auto"}); // หา status แล้วทำสิ่งนั้น
            }else{
                res.status(200).json({"data": null, "goto": "Add Bot Now"}); // เสร็จ
            }
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

//Bot
// 0 พึ่งแอดข้อมูล
// 1 อยู่ในเกม กดซื้อ Buy Bot
// 2 ซื้อเสร็จ ไปเทรด Trade Bot
// 3 trade เสร็จ สร้างตารางแล้ว Dele

//Mammoz
// 0 พร้อม
// 1 อยู่ในเกม ตั้ง Sell
// 2 Sell เสร็จ ไปเทรด Trade กับ Bot ถ้าเสร็จ อัพเดต ข้อมูล เป็น 0


// code Lua
// check
// if check == Mammoz
// ถาม /trademammoz ดู stsus ต้องทำอะไร

// if check == Bot Auto
// ถาม /tradebot ดู stsus ต้องทำอะไร

// if check == Add Bot Now
// /addtrade


// ADD Trade (BOT) AND ADD MAMMOZ AUTO เสร็จ
app.post('/addtrade', async (req, res) => {
  try {
        const { key, bot, gem, rr, map, status } = req.body;
        const findAd = await Ad.findOne({ status: 0, trade: { $ne: 0 } })
        if (findAd){
            const logCount = await Trade.countDocuments({ key: key, mammoz: findAd.bot, status: 0 });
            if (logCount < findAd.trade) {
                const newAd = await Ad.findOne({ 
                    key: key, 
                    status: 0, 
                    trade: { $ne: 0 }, 
                    _id: { $ne: adData._id }
                });
                const newLog = new Trade({ key, bot, mammoz: newAd.bot, gem, rr, map, status });
                await newLog.save();
                res.status(200).json(newLog);
            }else{
                res.status(400).json({ message: "ADD ERROR AD NOT FIND." });
            }

        }
        res.status(400).json({ message: "AD NOT FIND." });
  } catch (error) {
        res.status(400).json({ message: error.message });
  }
});

// UPDATE STATUS Trade (BOT) เสร็จ
app.post('/updatetrade', async (req, res) => {
    try {
        const { key, bot, status } = req.body;
        console.log(key, bot, status);
        const updatedAd = await Trade.findOneAndUpdate(
            { key: key, bot: bot },
            { status: status },
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

// DELE Trade (BOT) เสร็จ
app.post('/deletrade', async (req, res) => {
    try {
        const { key, bot } = req.body;
        const deletedTrade = await Trade.findOneAndDelete({ key: key, bot: bot });
        if (deletedTrade) {
            res.status(200).json({ message: 'Trade deleted successfully', data: deletedTrade });
        } else {
            res.status(404).json({ message: 'Trade not found for the provided key and bot' });
        }
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
});


// บอกว่า mammoz ต้องทำอะไร sell or trade
app.post('/trademammoz', async (req, res) => {
    try {
        const { key, bot } = req.body;
        const loade = await Trade.findOne({ key: key, bot: bot });
        res.status(200).json(loade);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

// บอกว่า bot ต้องทำอะไร buy or trade
app.post('/tradebot', async (req, res) => {
    try {
        const { key, bot } = req.body;
        const loade = await Trade.findOne({ key: key, bot: bot });
        res.status(200).json(loade);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});


// เพิ่มข้อมูลลง Log
app.post('/addlog', async (req, res) => {
    try {
        const { key, bot, gem, rr } = req.body;
        const loade = await Trade.findOne({ key: key, bot: bot, gem: gem, rr: rr });
        res.status(200).json(loade);
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