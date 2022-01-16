const express = require("express");
const app = express();
const PORT = process.env.PORT || 7777
app.listen(PORT, () => console.log(`Listening on port ${PORT} ...`));
app.post('/login', (req, res) => {
    
    // res.send('Hello Users!!');
    res.send('Hello Users!!');
});
console.log(app.get("krishna"));
