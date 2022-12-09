import NavBar from "../components/navbar/Navbar";
import "./contact.css";
function Contact() {
  return (
    <>
      <div className="contact">
        <NavBar />
        <div className="containertext">
          <h2>What we do</h2>
          <p>
            Note-taking is an essential skill that can benefit your life in a
            lot of ways.
            <br/>
             By taking notes, students can retain and understand
            information better and study easier. Similarly, every car enthusiast
            should have a way to keep a record of their favorite or dream cars.
            Our job is to make it happen. We provide a platform where you can
            keep track of the cars you like. Whenever you're making decisions on
            purchasing new rides or just flexing your wheels, this will come in
            handy.
          </p>
          <br />
          <br />
          <br />
          <br />
          <h1>Enough chitty chatter, get back to your cars </h1>
        </div>
      </div>
      <div className="footer">
        <h3>Email: mycarlib@care@gmail.com</h3>
        <h3>Phone: 072323232322/ 072323232322/ 072323232322</h3>
        <h3>Sms: 913923</h3>
      </div>
    </>
  );
}

export default Contact;
