import React, { useState } from "react";
import "../signup/signup.css";
import { useNavigate } from "react-router-dom";

function Signup({ onLogin, autologin }) {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [passwordConfirmation, setPasswordConfirmation] = useState("");
  const [errors, setErrors] = useState([]);

  const to_login = () => {
    navigate("/");
  };

  function handleSubmit(e) {
    e.preventDefault();
    setErrors([]);
    fetch("/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username,
        password,
        password_confirmation: passwordConfirmation,
      }),
    }).then((r) => {
      if (r.ok) {
        r.json().then((user) => onLogin(user));
        autologin();
        navigate("/home");
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }
  const handleClear = (event) => {
    event.target.value = "" || setErrors([]);
  };

  return (
    <>
      <div className="signup">
        <h1 className="logo">MyCarLibrary</h1>

        <div className="page">
          <div className="cover">
            <h1 style={{ color: "rgba(255,255, 3, 1)" }}>Signup </h1>
            <label for="username">
              <h3 style={{ color: "white" }}>Username</h3>
            </label>
            <input
              onClick={handleClear}
              type="text"
              className="input"
              placeholder="username"
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
              placeholder="**********"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            ></input>

            <label for="password confirmation">
              <h3 style={{ color: "white" }}>Password confirmation</h3>
            </label>
            <input
              onClick={handleClear}
              type="password"
              className="input"
              placeholder="**********"
              value={passwordConfirmation}
              onChange={(e) => setPasswordConfirmation(e.target.value)}
            ></input>

            <button onClick={handleSubmit} className="btn">
              SignUp
            </button>
            <button onClick={to_login} className="sgn">
              Have an account? <em>LogIn</em>
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

export default Signup;
