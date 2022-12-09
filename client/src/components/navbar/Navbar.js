import React from "react";
import "./NavBar.css";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";

function NavBar({ user, setUser }) {
  const navigate = useNavigate();

  function signOut() {
    fetch("/logout", { method: "DELETE" }).then((r) => {
      if (r.ok) {
        setUser(null);
        navigate("/");
      }
    });
  }
  return (
    <>
      <h2 className="flex header">MCL</h2>
      <div className="center-div">
        <nav>
          <ul className="nav-links">
            <Link to="/Dashboard">
              <li>Dashboard</li>
            </Link>
            <Link to="/review">
              <li>Review</li>
            </Link>
          </ul>
        </nav>
        <button className="signout" onClick={signOut}>
          Sign out
        </button>
      </div>
    </>
  );
}
export default NavBar;
