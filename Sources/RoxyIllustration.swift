import SwiftUI

/// 以 Shape、Path、Ellipse、Circle、Rectangle 和 ZStack 繪製的洛琪希。
/// 圖案未使用角色圖檔；參考圖只用來觀察比例、配色與服裝結構。
struct RoxyIllustration: View {
    var body: some View {
        ZStack {
            RoxyBackdrop()
            RoxyStaff()
            RoxyBackHair()
            RoxyCoat()
            RoxyUniform()
            RoxySleeves()
            RoxyCollar()
            RoxyBraids()
            RoxyFace()
            RoxyFringe()
            RoxyHat()
            RoxyHands()
        }
        .frame(width: 540, height: 800)
        .mask {
            LinearGradient(stops: [
                .init(color: .white, location: 0),
                .init(color: .white, location: 0.95),
                .init(color: .clear, location: 1)
            ], startPoint: .top, endPoint: .bottom)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("洛琪希，藍色雙辮子、黑金法師帽、棕色外袍，手持水晶法杖")
    }
}

// MARK: - 背景：柔光、細環與飄浮的魔力粒子
private struct RoxyBackdrop: View {
    var body: some View {
        ZStack {
            Ellipse()
                .fill(RadialGradient(
                    colors: [Color("RoxyCrystal").opacity(0.11), .clear],
                    center: .center, startRadius: 12, endRadius: 250
                ))
                .frame(width: 510, height: 660)
                .position(x: 290, y: 400)
            Circle()
                .stroke(Color("RoxyAccent").opacity(0.16), lineWidth: 0.7)
                .frame(width: 410)
                .position(x: 275, y: 367)
            Circle()
                .trim(from: 0.04, to: 0.69)
                .stroke(Color("RoxyAccent").opacity(0.23), lineWidth: 1)
                .frame(width: 430)
                .rotationEffect(.degrees(30))
                .position(x: 275, y: 367)
            ForEach(0..<20, id: \.self) { index in
                Circle()
                    .fill(index.isMultiple(of: 3) ? Color("RoxyAccent") : Color("RoxyCrystal"))
                    .opacity(index.isMultiple(of: 3) ? 0.5 : 0.26)
                    .frame(width: index.isMultiple(of: 4) ? 3.4 : 1.8,
                           height: index.isMultiple(of: 4) ? 3.4 : 1.8)
                    .position(
                        x: 50 + CGFloat((index * 131 + 23) % 445),
                        y: 54 + CGFloat((index * 97 + 51) % 645)
                    )
            }
            DrawnLine(path: "M 35 748 Q 265 762 504 740", color: Color("RoxyAccent").opacity(0.13), width: 0.8)
        }
    }
}

// MARK: - 法杖：彎曲木柄、環抱水晶的支架，以及水晶切面
private struct RoxyStaff: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 88 279 C 94 418 94 589 114 766 L 127 762 C 111 590 111 420 102 278 Z",
                Color("RoxyWood"), lineWidth: 2.3
            )
            PaintedPath(
                "M 88 278 L 89 315 L 103 314 L 102 278 Z",
                Color("RoxyAccent"), lineWidth: 1.3
            )
            DrawnLine(path: "M 95 338 C 106 492 99 612 118 746", color: Color("RoxyWoodLight"), width: 2.1)
            DrawnLine(path: "M 104 500 Q 111 530 108 559", color: Color("RoxyInk").opacity(0.5), width: 1)
            PaintedPath(
                "M 87 289 C 65 275 57 247 66 220 C 73 242 78 251 90 258 L 108 258 C 123 238 125 220 121 205 C 139 228 133 268 110 285 Z",
                Color("RoxyWood"), lineWidth: 2.3
            )
            PaintedPath(
                "M 88 283 C 73 264 68 246 69 232 C 72 254 84 265 98 269 C 119 258 126 247 128 233 Q 130 266 108 282 Z",
                Color("RoxyWoodLight"), lineWidth: 0
            )
            Circle()
                .fill(Color("RoxyCrystal").opacity(0.1))
                .frame(width: 105)
                .blur(radius: 13)
                .position(x: 96, y: 218)
            PaintedPath(
                "M 96 172 L 118 208 L 111 247 L 94 262 L 75 244 L 75 205 Z",
                Color("RoxyCrystal"), lineWidth: 1.8, outline: Color("RoxyCrystalLight")
            )
            PaintedPath(
                "M 96 172 L 97 210 L 75 205 Z M 97 210 L 94 262 L 75 244 L 75 205 Z",
                Color("RoxyCrystalLight"), lineWidth: 0
            )
            PaintedPath(
                "M 97 210 L 118 208 L 111 247 L 94 262 Z",
                Color("RoxyEye").opacity(0.66), lineWidth: 0
            )
            DrawnLine(path: "M 96 172 L 97 210 L 94 262 M 75 205 L 97 210 L 118 208",
                      color: Color("RoxyCrystalLight").opacity(0.7), width: 0.9)
            PaintedPath("M 81 212 L 86 205 L 87 233 L 82 240 Z", .white.opacity(0.7), lineWidth: 0)
            PaintedPath("M 84 293 Q 98 287 110 291 L 111 300 Q 97 296 85 302 Z",
                        Color("RoxyAccent"), lineWidth: 1.1)
            DrawnLine(path: "M 87 296 Q 98 292 108 295", color: Color("RoxyPaper"), width: 0.8)
        }
    }
}

// MARK: - 後髮：冷藍紫色大面積、分區陰影與向外的髮尾
private struct RoxyBackHair: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 183 211 C 164 246 167 325 176 373 L 164 435 Q 184 423 191 410 L 184 466 Q 205 444 217 413 L 315 407 Q 347 457 375 449 L 351 413 Q 386 437 394 421 C 369 411 368 373 357 352 C 367 276 352 221 330 206 Z",
                Color("RoxyHairShadow"), lineWidth: 2
            )
            PaintedPath(
                "M 175 249 C 169 290 182 358 180 403 L 193 389 L 191 435 Q 209 409 215 371 L 213 241 Z",
                Color("RoxyHair"), lineWidth: 0
            )
            PaintedPath(
                "M 325 227 C 352 277 340 344 362 391 Q 371 406 383 406 Q 357 414 337 386 C 329 357 323 290 311 253 Z",
                Color("RoxyHair"), lineWidth: 0
            )
            DrawnLine(path: "M 182 251 C 175 299 187 341 189 367 Q 189 393 183 411",
                      color: Color("RoxyHairLight").opacity(0.7), width: 1.1)
            DrawnLine(path: "M 342 261 C 350 315 338 358 361 395", color: Color("RoxyHairLight"), width: 1)
            DrawnLine(path: "M 197 336 Q 210 383 198 420 M 332 334 Q 332 378 350 409",
                      color: Color("RoxyHairDeep"), width: 1.1)
        }
    }
}

// MARK: - 長外袍：內裏、左右衣片、白色滾邊與布料皺摺
private struct RoxyCoat: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 190 380 C 173 404 161 459 151 531 L 107 751 C 161 736 214 742 260 759 C 318 768 360 747 397 759 C 421 701 409 625 401 568 L 362 408 L 333 372 Z",
                Color("RoxyCloakShade"), lineWidth: 2.2
            )
            PaintedPath(
                "M 193 386 C 169 420 155 492 145 559 L 108 755 Q 136 726 149 713 Q 173 618 181 565 L 220 392 Z",
                Color("RoxyCloak"), lineWidth: 1.8
            )
            PaintedPath(
                "M 179 431 Q 166 525 153 584 L 138 699 L 157 676 C 168 623 173 585 181 562 L 207 416 Z",
                Color("RoxyCloakLight"), lineWidth: 0
            )
            PaintedPath(
                "M 323 382 C 369 398 392 472 401 559 Q 421 689 397 760 L 373 743 C 386 645 359 607 351 539 L 302 409 Z",
                Color("RoxyCloak"), lineWidth: 1.8
            )
            PaintedPath(
                "M 345 421 Q 373 490 374 554 C 374 617 404 647 395 730 L 377 736 Q 389 657 359 604 L 345 511 Z",
                Color("RoxyCloakShade").opacity(0.53), lineWidth: 0
            )
            DrawnLine(path: "M 178 466 C 174 538 162 617 153 675 M 134 697 L 124 733 M 374 565 Q 384 623 390 656 M 382 689 L 385 727",
                      color: Color("RoxyInk").opacity(0.65), width: 1.6)
            PaintedPath(
                "M 203 396 L 215 405 C 199 492 185 618 166 698 L 148 709 C 171 587 174 491 203 396 Z",
                Color("RoxyPaperShade"), lineWidth: 1.5
            )
            PaintedPath(
                "M 319 391 L 329 400 C 335 504 357 608 372 750 L 385 760 C 374 602 351 492 335 393 Z",
                Color("RoxyPaper"), lineWidth: 1.5
            )
        }
    }
}

// MARK: - 內搭：藍黑長衣、白襯衫、交叉束帶、金鍊腰飾與黑裙
private struct RoxyUniform: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 214 397 Q 269 386 322 399 L 336 653 L 306 710 L 191 700 L 185 631 Z",
                Color("RoxyUniform"), lineWidth: 1.9
            )
            PaintedPath(
                "M 222 439 Q 216 528 207 626 L 197 675 Q 244 702 308 674 L 311 619 L 316 444 Z",
                Color("RoxyUniformLight"), lineWidth: 0
            )
            // 三分之二身像的腿部在畫布下緣淡出，保留完整的身體結構。
            PaintedPath(
                "M 205 711 L 250 719 L 252 800 L 217 800 Q 204 763 205 711 Z M 280 720 L 325 709 Q 331 750 324 800 L 287 800 Z",
                Color("RoxySkin"), lineWidth: 1.6, outline: Color("RoxySkinLine")
            )
            PaintedPath(
                "M 207 723 L 249 730 L 248 758 Q 228 752 213 744 Z M 282 730 L 324 720 L 326 744 Q 304 757 284 754 Z",
                Color("RoxySkinShade"), lineWidth: 0
            )
            PaintedPath(
                "M 198 629 Q 252 660 326 633 L 348 703 L 360 722 L 344 720 Q 336 745 313 735 Q 302 755 280 744 Q 262 763 245 745 Q 224 758 209 741 Q 188 751 177 729 L 161 727 Z",
                Color("RoxyHat"), lineWidth: 2
            )
            PaintedPath(
                "M 210 667 Q 251 696 312 671 L 326 701 Q 270 714 218 690 Z",
                Color("RoxyInk").opacity(0.55), lineWidth: 0
            )
            DrawnLine(path: "M 207 678 Q 219 706 216 730 M 248 687 L 248 737 M 287 683 Q 276 717 278 736 M 313 675 Q 321 701 313 728",
                      color: Color("RoxyHatLight"), width: 1.6)
            ForEach(0..<6, id: \.self) { index in
                Capsule()
                    .fill(Color("RoxyPaper").opacity(0.85))
                    .frame(width: 2, height: 3.5)
                    .rotationEffect(.degrees(Double(index - 3) * 5))
                    .position(x: 190 + CGFloat(index) * 28, y: index.isMultiple(of: 2) ? 733 : 744)
            }
            PaintedPath(
                "M 214 401 Q 220 447 210 508 C 196 546 187 590 181 647 L 214 658 C 224 567 235 525 239 458 L 237 397 Z",
                Color("RoxyPaper"), lineWidth: 1.8
            )
            PaintedPath(
                "M 300 393 L 321 401 Q 317 467 322 504 C 329 555 341 609 347 648 L 309 658 Q 300 568 294 517 L 294 430 Z",
                Color("RoxyPaper"), lineWidth: 1.8
            )
            PaintedPath(
                "M 215 423 L 227 420 C 222 489 229 513 210 644 L 219 650 C 239 523 232 470 241 418 Z",
                Color("RoxyHair"), lineWidth: 1
            )
            PaintedPath(
                "M 292 415 L 303 415 Q 302 496 310 540 L 321 649 L 311 652 Q 294 531 292 415 Z",
                Color("RoxyHair"), lineWidth: 1
            )
            DrawnLine(path: "M 203 490 L 191 530 M 199 558 L 190 606 M 185 639 L 205 647 M 320 499 Q 324 532 334 549 M 332 633 L 345 639",
                      color: Color("RoxyPaperShade"), width: 2)
        }
        .overlay { uniformStraps }
    }

    private var uniformStraps: some View {
        ZStack {
            PaintedPath("M 236 455 L 299 490 L 297 501 L 232 466 Z",
                        Color("RoxyHat"), lineWidth: 1.3)
            PaintedPath("M 297 450 L 231 490 L 231 502 L 299 462 Z",
                        Color("RoxyHat"), lineWidth: 1.3)
            DrawnLine(path: "M 239 461 L 294 491 M 294 455 L 235 491",
                      color: Color("RoxyHatLight"), width: 0.8)
            PaintedPath("M 229 534 Q 260 550 301 536 L 302 544 Q 266 559 227 543 Z",
                        Color("RoxyAccent"), lineWidth: 1)
            PaintedPath("M 224 575 Q 260 592 307 574 L 309 583 Q 263 601 222 584 Z",
                        Color("RoxyAccent"), lineWidth: 1)
            DrawnLine(path: "M 237 541 Q 269 553 293 542 M 232 582 Q 269 595 297 581",
                      color: Color("RoxyGoldLight"), width: 0.9)
            ForEach(0..<2, id: \.self) { index in
                RoundedRectangle(cornerRadius: 1.5)
                    .stroke(Color("RoxyAccent"), lineWidth: 2.4)
                    .frame(width: 8, height: 13)
                    .position(x: 222 + CGFloat(index) * 86, y: index == 0 ? 539 : 580)
            }
        }
    }
}

// MARK: - 手臂與袖子：不對稱姿勢、白袖及有扣子的黑色袖口
private struct RoxySleeves: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 181 428 Q 166 451 143 483 C 118 512 96 514 88 496 L 77 514 Q 93 547 125 541 C 153 533 174 514 194 489 Z",
                Color("RoxyPaper"), lineWidth: 1.8
            )
            PaintedPath(
                "M 171 465 Q 158 495 128 519 Q 111 529 95 520 L 101 534 C 132 543 166 512 185 486 Z",
                Color("RoxyPaperShade"), lineWidth: 0
            )
            DrawnLine(path: "M 147 489 Q 136 516 115 521 M 159 485 L 167 475",
                      color: Color("RoxyInk").opacity(0.55), width: 1.1)
            PaintedPath(
                "M 76 499 Q 91 494 105 507 L 99 531 Q 88 539 71 530 L 68 515 Z",
                Color("RoxyHat"), lineWidth: 1.8
            )
            PaintedPath(
                "M 352 439 Q 378 463 402 512 L 418 550 L 395 573 Q 366 540 346 510 L 329 474 Z",
                Color("RoxyPaper"), lineWidth: 1.8
            )
            PaintedPath(
                "M 353 478 Q 369 497 371 514 L 395 557 L 405 556 C 389 525 384 511 369 489 Z",
                Color("RoxyPaperShade"), lineWidth: 0
            )
            DrawnLine(path: "M 355 496 Q 376 519 381 538 M 375 507 L 393 516 M 357 481 L 350 476",
                      color: Color("RoxyInk").opacity(0.55), width: 1.1)
            PaintedPath(
                "M 396 538 Q 414 530 429 544 L 445 570 Q 424 593 409 586 L 390 559 Z",
                Color("RoxyHat"), lineWidth: 1.8
            )
            DrawnLine(path: "M 410 548 L 432 576 M 83 507 L 79 527",
                      color: Color("RoxyHatLight"), width: 1.2)
            ForEach(0..<2, id: \.self) { index in
                Circle()
                    .fill(Color("RoxyAccent"))
                    .overlay(Circle().stroke(Color("RoxyInk"), lineWidth: 0.8))
                    .frame(width: 4.3, height: 4.3)
                    .position(x: 410 + CGFloat(index) * 9, y: 559 + CGFloat(index) * 12)
            }
        }
    }
}

// MARK: - 披肩與立領：白色滾邊、雙排扣與內搭领帶
private struct RoxyCollar: View {
    var body: some View {
        ZStack {
            PaintedPath("M 237 353 L 236 398 Q 266 421 293 394 L 291 352 Z",
                        Color("RoxySkin"), lineWidth: 1.5)
            PaintedPath("M 238 359 Q 265 386 291 357 L 291 376 Q 262 399 237 383 Z",
                        Color("RoxySkinShade"), lineWidth: 0)
            PaintedPath("M 227 381 L 242 377 L 263 397 L 288 373 L 303 382 L 287 422 L 237 424 Z",
                        Color("RoxyPaper"), lineWidth: 1.6)
            PaintedPath("M 252 397 L 273 395 L 278 409 L 269 442 L 253 430 L 249 409 Z",
                        Color("RoxyPaperShade"), lineWidth: 1.2)
            DrawnLine(path: "M 253 407 L 276 405 M 258 412 L 259 427",
                      color: Color("RoxyInk"), width: 1)
            PaintedPath(
                "M 204 382 Q 176 385 157 413 L 132 472 L 158 486 Q 185 494 209 479 L 222 419 Z",
                Color("RoxyCloak"), lineWidth: 1.8
            )
            PaintedPath(
                "M 318 377 C 361 380 382 401 395 445 L 409 475 Q 368 498 319 487 L 307 410 Z",
                Color("RoxyCloak"), lineWidth: 1.8
            )
            PaintedPath("M 172 421 Q 194 406 211 419 L 205 452 Q 194 478 154 476 Z",
                        Color("RoxyCloakLight"), lineWidth: 0)
            PaintedPath("M 335 402 Q 358 408 387 437 L 371 436 L 336 419 Z",
                        Color("RoxyCloakShade").opacity(0.8), lineWidth: 0)
            DrawnLine(path: "M 173 411 Q 193 405 208 415 M 333 408 Q 363 420 380 435 M 360 455 L 383 450",
                      color: Color("RoxyInk").opacity(0.7), width: 1.5)
            PaintedPath(
                "M 176 355 L 224 344 L 236 387 L 219 407 L 207 478 Q 170 486 132 466 L 127 477 Q 173 503 218 491 L 233 406 L 247 391 L 230 330 L 172 343 Z",
                Color("RoxyPaper"), lineWidth: 1.6
            )
            PaintedPath(
                "M 302 331 L 360 345 L 362 360 L 323 354 L 307 393 L 317 403 L 323 478 Q 365 486 408 466 L 412 477 Q 369 502 314 491 L 300 405 L 286 391 Z",
                Color("RoxyPaper"), lineWidth: 1.6
            )
            DrawnLine(path: "M 178 353 L 219 344 L 233 389 L 219 401 L 208 477 M 307 343 L 293 391 L 307 401 L 319 480",
                      color: Color("RoxyHat"), width: 4)
            PaintedPath("M 222 409 L 304 407 L 306 427 L 219 429 Z",
                        Color("RoxyPaper"), lineWidth: 1.7)
            PaintedPath("M 220 440 L 306 438 L 309 458 L 218 460 Z",
                        Color("RoxyPaper"), lineWidth: 1.7)
            ForEach(0..<4, id: \.self) { index in
                Circle()
                    .fill(Color("RoxyHat"))
                    .overlay(Circle().stroke(Color("RoxyInk"), lineWidth: 1))
                    .frame(width: 9, height: 9)
                    .position(x: index.isMultiple(of: 2) ? 231 : 293,
                              y: index < 2 ? 418 : 449)
            }
        }
    }
}
