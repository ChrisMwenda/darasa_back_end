import NavBar from "../components/navbar/Navbar";
import { useNavigate } from "react-router-dom";
import "./review.css";
import { useState } from "react";
function Review() {
  const [title, setTitle] = useState("Front-end design with React");
  const [teacher_name, setTeachername] = useState("Beatrice Wambui");
  const [comment, setComment] = useState(
    " Bobo is a very thoughtful teacher who puts a lot of thought into how she presents the material."
  );
  const [image_url, setImage_url] = useState(
    "https://media.istockphoto.com/id/1287464946/vector/strong-black-woman-with-curly-hair-smiles-and-looks-directly-confident-young-woman-with.jpg?s=612x612&w=0&k=20&c=ZsblOZ1JE0ZAPS-LPZmlJbfyR5_2PZ6wx-7XH6SOr6I="
  );
  const [errors, setErrors] = useState([]);
  const navigate = useNavigate();

  function handleSubmit(e) {
    e.preventDefault();
    fetch("/reviews", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        title,
        teacher_name,
        image_url,
        comment,
      }),
    }).then((r) => {
      if (r.ok) {
        navigate("/dashboard");
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

   return (
    <>
      <div className="review">
        <NavBar />
        <div className="review-card">
          <div className="container">
            <form className="form" onSubmit={handleSubmit}>
              <label for="title">title</label>
              <input
              
                placeholder="Subject title e.g Authentication in Rails"
                required
                value={title}
                onChange={(e) => setTitle(e.target.value)}
              />
              <label for="teacher_name">Teacher Name</label>
              <input
              
                placeholder="Teacher Name"
                required
                value={teacher_name}
                onChange={(e) => setTeachername(e.target.value)}
              />
              <label for="image_url">Image</label>
              <input
              
                placeholder="Image url"
                autoComplete="off"
                required
                value={image_url}
                onChange={(e) => setImage_url(e.target.value)}
              />

              <label for="comment">Comment</label>
              <input
              
                className="comment"
                placeholder="How would you describe your experience with this teacher?"
                value={comment}
                onChange={(e) => setComment(e.target.value)}
              />
              <button className="submit" type="submit">
                <em>Review</em>
              </button>
            </form>
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

export default Review;
