const pay = () => {
  Payjp.setPublicKey("pk_test_af8c5998c17f5c0cffb65757");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("buyer_address[number]"),
      cvc: formData.get("buyer_address[cvc]"),
      exp_month: formData.get("buyer_address[exp_month]"),
      exp_year: `20${formData.get("buyer_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card_number").removeAttribute("name");
      document.getElementById("card_cvc").removeAttribute("name");
      document.getElementById("card_exp_month").removeAttribute("name");
      document.getElementById("card_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    })
  })
}

window.addEventListener("load", pay);
