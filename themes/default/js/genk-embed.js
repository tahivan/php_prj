String.format = function (text) {
    if (arguments.length <= 1) {
        return text;
    }
    var tokenCount = arguments.length - 2;
    for (var token = 0; token <= tokenCount; token++) {
        text = text.replace(new RegExp("\\{" + token + "\\}", "gi"), arguments[token + 1]);
    }
    return text;
};



var hSohaEmbed = new function () {

    this.imageWidth = 187;
    this.imageHeight = 120;
    this.top = 28;
    this.type = 2;

    this.sohaSlideWrapper = "hSohaSlideWrapper";
    //GET DATA 
    this.getData = function () {
        makeItSlideable();
    }
    //MAKE IT SLIDE
    var makeItSlideable = function () {

        var currentPosition = 0;
        var slideWidth = 600;
        var displayNum = 1;
        var speed = 8000;
        var slides = $(".hSohaEmbed_box-sohact");
        if (slides.length > 0) {
            var numberOfSlides = slides.length;
            var numberOfDisplay = Math.ceil(numberOfSlides / displayNum);

            slides.hide();

            var slideWrapper = $("#hSohaSlideWrapper");
            slideWrapper.css({
                "width": numberOfSlides * slideWidth + "px",
                "float": "left",
                "position": "relative"
            });

            slideWrapper.wrapAll("<div id='hSohaViewPort'></div>");
            var viewPort = $("#hSohaViewPort");
            viewPort.css({
                "width": slideWidth * displayNum + "px",
                "float": "left",
                "position": "relative",
                "overflow": "hidden"
            });

            slides.show();

            var lis = viewPort.find("li");
            var numberOfLi = lis.length;
            var counterFormat = " {0} - {1} / {2}";

            function changePosition() {
                if (currentPosition == numberOfDisplay - 1) {
                    currentPosition = 0;
                } else {
                    currentPosition++;
                }
                moveSlide();
            }

            function moveSlide() {
                slideWrapper.animate({ 'marginLeft': slideWidth * displayNum * (-currentPosition) });
                $("#hSohaEmbed_SlideCounter").html(String.format(
                            counterFormat,
                            (currentPosition + 1) * 3 - 3 + 1,
                            (currentPosition + 1) * 3 <= numberOfLi ? (currentPosition + 1) * 3 : numberOfLi,
                            numberOfLi
                        ));
            }

            function setCouterStatus() {
                $("#hSohaEmbed_SlideCounter").html(String.format(
                            counterFormat,
                            (currentPosition + 1) * 3 - 3 + 1,
                            (currentPosition + 1) * 3 <= numberOfLi ? (currentPosition + 1) * 3 : numberOfLi,
                            numberOfLi
                        ));
            }
            setCouterStatus();

            function changePositionToLeft() {

                if (currentPosition <= 0) {
                    currentPosition = numberOfDisplay - 1;
                } else {
                    currentPosition--;
                }
                moveSlide();
            }

            function changePositionToLeft() {

                if (currentPosition <= 0) {
                    currentPosition = numberOfDisplay - 1;
                } else {
                    currentPosition--;
                }
                moveSlide();
            }

            var sohaEmbedInterval = setInterval(changePosition, speed);


            $('.hSohaEmbed_box-sohact').hover(
                function () {
                    clearInterval(sohaEmbedInterval);
                },
                function () {
                    sohaEmbedInterval = setInterval(changePosition, speed);
                }
            );

            $('#hSohaEmbed_btnNext').hover(
                        function () {
                            clearInterval(sohaEmbedInterval);
                            $(this).bind('click', changePosition);
                        },
                        function () {
                            $(this).unbind('click');
                            sohaEmbedInterval = setInterval(changePosition, speed);
                        }
                    );

            $('#hSohaEmbed_btnPre').hover(
                        function () {
                            clearInterval(sohaEmbedInterval);
                            $(this).bind('click', changePositionToLeft);
                        },
                        function () {
                            $(this).unbind('click');
                            sohaEmbedInterval = setInterval(changePosition, speed);
                        }
                    );

        }

    }
};

hSohaEmbed.getData();