import $ from "jquery"
import select2 from "select2"

const initSelect2 = () => {
  $(document).ready(function () {
    $(".assign-form").select2();
  });
}

export { initSelect2 }
