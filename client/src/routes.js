import React from "react";
import { Route, Routes } from "react-router-dom";
import Login from "./login/Login.js";
import Dashboard from "./dashboard/dashboard.js";
import Review from "./form/Review.js";
import Signup from "./signup/SignUp.js";
// import EditPropertyForm from "./components/AddPropertyForm ";
const BaseRouter = ({setUser,user, autologin}) => (
  <div>
    <Routes>
      <Route path="/" element={<Login autologin={autologin} />} />
      <Route path="/signup" element={<Signup autologin={autologin}/>} />
      <Route path="/Dashboard" element={<Dashboard user={user} setUser={setUser} />} />
      <Route path="/review" element={<Review />} />
           

    </Routes>
  </div>
);
export default BaseRouter;
