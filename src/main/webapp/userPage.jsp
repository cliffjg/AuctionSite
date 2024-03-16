<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en" style="height: auto;background: var(--bs-cyan);">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AddAuction</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>

<body style="position: relative;border-radius: 2px;background: transparent;">
    <div style="background: transparent;">
        <div style="width: 900px;height: 500px;position: absolute;margin-top: 57%;margin-left: 50%;transform: translateX(-50%) translateY(-150%) translateZ(314px);margin-bottom: 0px;transform-style: preserve-3d;border-radius: 0px;background: var(--bs-tertiary-bg);border-style: none;border-color: var(--bs-btn-hover-color);">
            <div class="container" style="width: 100%;height: 100%;display: inline-flex;position: absolute;">
                
                <div style="width: 100%;height: 100%;margin: 0px;padding-left: 5px;">

                    <div class="visible" style="width: 100%;height: 70%;display: block;">
                        <div style="width: 100%;height: 10%;">
                            <label class="form-label" style="width: 100%;text-align: center;padding-top: 10px;color: rgb(118,120,122);">
                                Add Auction</label>
                            </div>
                            <input type="file" style="width: 100%;height: 100%; cursor: pointer;">
                    </div>

                    <div style="width: 100%;height: 70%;margin-left: 0px;padding-bottom: 10px;padding-top: 10px;">
                        <label class="form-label" style="height: 0%;width: 100%;color: rgb(118,120,122);">
                            Car Description
                        </label>
                        <textarea style="width: 100%;height: 30%;border-radius: 6px;border: 1px solid rgb(230,231,232) ;">
                        </textarea>
                    </div>

                </div>

                <div style="width: 100%;height: 100%;padding-top: 5px;padding-right: 5px;border-color: rgb(205,206,207);max-height: inherit;margin-right: 20px;margin-left: 20px;">
                    <div style="width: 100%;height: 60px;">
                        <div style="width: 100%;height: 40%;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Year
                            </label>
                        </div>
                        <div style="width: 100%;height: 60%;">
                            <input type="number" min="1900" max="2026" maxlength="4" step="1" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(230,231,232) ;">
                        </div>
                    </div>

                    <div style="width: 100%;height: 60px;">

                        <div style="width: 100%;height: 40%;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Make
                            </label>
                        </div>

                        <div style="width: 100%;height: 60%;">
                            <input type="text" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(230,231,232) ;">
                        </div>
                    </div>

                    <div style="width: 100%;height: 60px;">
                        <div style="width: 100%;height: 40%;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Model
                            </label>
                        </div>
                        <div style="width: 100%;height: 60%;">
                            <input type="text" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(230,231,232) ;">
                        </div>
                    </div>

                    <div style="width: 100%;height: 60px;">
                        <div style="width: 100%;height: 40%;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Color
                            </label>
                        </div>

                        <div style="width: 100%;height: 60%;">
                            <input type="text" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;color: rgb(136,77,110);border: 1px solid rgb(230,231,232) ;">
                        </div>
                    </div>

                    <div style="width: 100%;height: 60px;">
                        <div style="width: 100%;height: 40%;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Starting Bid
                            </label>
                        </div>

                        <div style="width: 100%;height: 60%;">
                            <input type="text" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(230,231,232) ;">
                        </div>
                    </div>
                    <div style="width: 100%;height: 60px;">
                        <div style="width: 100%;height: 40%;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Price
                            </label>
                        </div>
                        <div style="width: 100%;height: 60%;">
                            <input type="number" step="1" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(230,231,232) ;">
                        </div>
                    </div>

                    <div style="width: 100%;height: 60px;">
                        <div style="width: 100%;height: 40%;margin-top: 3px;">
                            <label class="form-label" style="height: 100%;width: 100%;padding-left: 10px;padding-top: 0px;color: rgb(118,120,122);">
                                Expiration Date (*Required)
                            </label>
                        </div>
                        <div  style="width: 100%;height: 60%;">
                            <input type="datetime-local" style="width: 100%;height: 100%;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(230,231,232) ;" required>
                        </div>
                    </div>
                    <div style="width: 100%;height: inherit;padding-bottom: 50%;max-height: inherit;">
                        <input class="btn btn-primary" type="submit" style="margin-top: 20px;width: 100%;height: initial;background: linear-gradient(-163deg, #0ce4fe 18%, #27cffe 44%, #42b8fe 80%, #4daefd 100%), #27cffe;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>



<!--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

