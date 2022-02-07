import express from "express";

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.post("/", (req, res) => {

  console.log("POST Say hello from Serverless Docker Node Container!");

  return res.send("Success!");
});

app.get("/", (req, res) => {

  console.log("GET Say hello from Serverless Docker Node Container!");

  return res.send("Success! GET");
});

app.listen(process.env.PORT, () => {
  console.log(`App listening at http://localhost:${process.env.PORT}`);
});
