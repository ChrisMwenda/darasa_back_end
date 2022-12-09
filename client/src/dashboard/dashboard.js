import NavBar from "../components/navbar/Navbar";
import React, { useEffect, useState } from "react";
import Login from "../login/Login";
import "./dashboard.css";
import Search from "../components/Search";

function Dashboard({ setUser, user }) {
  const [search, setSearch] = useState("");

  const [reviews, setReviews] = useState([]);

  useEffect(() => {
    getReviews();
  }, []);
  function getReviews() {
    fetch("/reviews")
      .then((r) => r.json())
      .then(setReviews);
  }

  const teacher = reviews
    .filter((item) => {
      return search.toLowerCase() === ""
        ? item
        : item.name.toLowerCase().includes(search.toLowerCase());
    })
    .map((teacher) => {
      return (
        <div key={teacher.id} className="teacher-card">
          <img className="img" alt="teacher" src={teacher.image_url} />
          <h4>Title: {teacher.title}</h4>
          <h4>Teacher Name: {teacher.teacher_name}</h4>
          <h4>comment:</h4>
          <textarea className="txt">{teacher.comment}</textarea>
          <div className="btnholder">
            <button className="bt green">
              <em>Edit</em>
            </button>
            <button
              className="bt red"
              onClick={() => {
                handleDeleteButton(teacher.id);
              }}
            >
              <em>Remove</em>
            </button>
          </div>
        </div>
      );
    });

  function handleDeleteButton(id) {
    fetch(`/reviews/${id}`, {
      method: "DELETE",
    })
      .then((res) => res.json)
      .then(getReviews);
  }

  if (!user) return <Login onLogin={setUser} />;
  return (
    <>
      <div className="home">
        <NavBar user={user} setUser={setUser} />
        <Search setSearch={setSearch} />
        <div className="dashboard_card">{teacher}</div>
      </div>
      <p className="initial" >Add a teacher to review</p>
    </>
  );
}

export default Dashboard;
