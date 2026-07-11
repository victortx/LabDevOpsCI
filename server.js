const express = require("express");
const { Pool } = require("pg");

const app = express();
const PORT = process.env.PORT || 3000;

const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 5432,
  database: process.env.DB_NAME || "devops_lab",
  user: process.env.DB_USER || "devops_user",
  password: process.env.DB_PASSWORD || "devops_password"
});


app.get("/", (req, res) => {
  res.json({
    message: "DevOps mini parcial API",
    status: "OK"
  });
});

app.get("/health", async (req, res) => {
  try {
    await pool.query("SELECT 1");

    res.json({
      status: "healthy",
      database: "connected",
      uptime: process.uptime()
    });
  } catch (error) {
    res.status(500).json({
      status: "unhealthy",
      database: "disconnected",
      error: error.message
    });
  }
});

app.get("/api/expenses", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT id, description, amount, category  FROM expenses  ORDER BY id ASC"
    );

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({
      message: "Error obteniendo usuarios",
      error: error.message
    });
  }
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`API running on http://0.0.0.0:${PORT}`);
});
