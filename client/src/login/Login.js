import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

import "../login/login.css";
function Login({ onLogin, autologin }) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);
  function handleSubmit(e) {
    e.preventDefault();
    fetch("/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username, password }),
    }).then((r) => {
      if (r.ok) {
        autologin();
        to_home();
        r.json().then((user) => onLogin(user));
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

  const navigate = useNavigate();

  const to_signup = () => {
    navigate("/signup");
  };
  const to_home = () => {
    navigate("/home");
  };

  const handleClear = (event) => {
    event.target.value = "";
    setErrors([]);
  };

  return (
    <>
      <div className="login">
        <h1 className="logo">MyCarLibrary</h1>

        <div className="page">
          <div className="cover">
            <h1 style={{ color: "rgba(255,255, 3, 1)" }}>Login </h1>

            <label for="username">
              <h3 style={{ color: "white" }}>Username</h3>
            </label>
            <input
              onClick={handleClear}
              type="text"
              className="input"
              placeholder="username"
              autoComplete="off"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            ></input>
            <label for="password">
              <h3 style={{ color: "white" }}>Password</h3>
            </label>

            <input
              onClick={handleClear}
              type="password"
              className="input"
              placeholder="******"
              autoComplete="current-password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            ></input>
            <button className="btn" onClick={handleSubmit}>
              Login
            </button>
            <button type="submit" onClick={to_signup} className="sgn">
              Don't have an account? <em>SignUp</em>
            </button>
          </div>
          {errors.map((err) => (
            <li className="key" key={err}>
              {err}
            </li>
          ))}
        </div>
      </div>
    </>
  );
}

export default Login;
