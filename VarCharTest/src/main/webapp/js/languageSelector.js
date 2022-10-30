 const languageSelector = document.querySelector(".languageSelector");
      const grayBox = document.querySelector(".grayBox");
      const languageBox = document.querySelector(".languageBox");
      const languageSelectorMsg = document.querySelector(
        ".languageSelectorMsg"
      );
      
      languageSelector.addEventListener("click", () => {
        grayBox.style.display = "block";
        languageBox.style.display = "flex";
      });

      languageSelector.addEventListener("mouseover", () => {
        languageSelectorMsg.innerText = "choose your language!";
        languageSelectorMsg.style.padding = "10px";
      });

      languageSelector.addEventListener("mouseout", () => {
        languageSelectorMsg.innerText = "";
        languageSelectorMsg.style.padding = "0";
      });

      grayBox.addEventListener("click", (e) => {
        grayBox.style.display = "none";
        languageBox.style.display = "none";
      });
      
        document.querySelector("body").onkeyup = (e) => {
        if (e.key === "Escape") {
          console.log(e.key);
          grayBox.style.display = "none";
          languageBox.style.display = "none";
        }
      };
      const countries = document.getElementsByClassName("language");
      const languages = ['ko', 'jp', 'en', 'zh'];

      for(let i = 0; i < countries.length; i++) {
        countries[i].onclick = () => {
          location.href = "language.do?lang=" + languages[i];
        }
      }