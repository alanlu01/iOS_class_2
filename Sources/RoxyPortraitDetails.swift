import SwiftUI

// MARK: - 長辮子：每一節由交錯的葉形組成，不使用圓球代替
struct RoxyBraids: View {
    var body: some View {
        ZStack {
            braid(baseX: 183, baseY: 363, direction: -1, count: 9)
            braid(baseX: 346, baseY: 357, direction: 1, count: 10)
            ribbon(x: 123, y: 597, angle: 13)
            ribbon(x: 421, y: 618, angle: -15)
        }
    }

    private func braid(baseX: CGFloat, baseY: CGFloat,
                       direction: CGFloat, count: Int) -> some View {
        ZStack {
            ForEach(0..<count, id: \.self) { index in
                let x = baseX + direction * CGFloat(index) * 7.5
                let y = baseY + CGFloat(index) * 24.4
                let width: CGFloat = 37 - CGFloat(index) * 1.1
                ZStack {
                    IllustrationPath(
                        instructions: "M 5 0 C 15 2 29 10 33 21 Q 29 34 20 42 Q 18 26 5 19 Q 0 10 5 0 Z",
                        canvas: CGSize(width: 38, height: 43)
                    )
                    .fill(Color("RoxyHairShadow"))
                    .overlay {
                        IllustrationPath(
                            instructions: "M 5 0 C 15 2 29 10 33 21 Q 29 34 20 42 Q 18 26 5 19 Q 0 10 5 0 Z",
                            canvas: CGSize(width: 38, height: 43)
                        )
                        .stroke(Color("RoxyInk"), style: StrokeStyle(lineWidth: 1.4, lineJoin: .round))
                    }
                    IllustrationPath(
                        instructions: "M 34 2 C 23 5 10 15 5 25 Q 9 37 18 42 Q 22 29 32 21 Q 38 12 34 2 Z",
                        canvas: CGSize(width: 38, height: 43)
                    )
                    .fill(Color("RoxyHair"))
                    .overlay {
                        IllustrationPath(
                            instructions: "M 34 2 C 23 5 10 15 5 25 Q 9 37 18 42 Q 22 29 32 21 Q 38 12 34 2 Z",
                            canvas: CGSize(width: 38, height: 43)
                        )
                        .stroke(Color("RoxyInk"), style: StrokeStyle(lineWidth: 1.4, lineJoin: .round))
                    }
                    IllustrationPath(
                        instructions: "M 30 7 Q 20 14 13 26 M 10 5 Q 23 12 26 19",
                        canvas: CGSize(width: 38, height: 43)
                    )
                    .stroke(Color("RoxyHairLight").opacity(0.6), style: StrokeStyle(lineWidth: 1, lineCap: .round))
                }
                .frame(width: width, height: 38)
                .rotationEffect(.degrees(Double(direction) * -17))
                .position(x: x, y: y)
            }
        }
    }

    private func ribbon(x: CGFloat, y: CGFloat, angle: Double) -> some View {
        ZStack {
            IllustrationPath(
                instructions: "M 46 29 C 32 13 16 5 6 10 C -2 16 14 32 43 35 L 26 61 L 18 63 L 37 35 Z M 49 30 C 65 8 82 5 86 14 C 89 27 67 36 52 35 L 65 61 L 56 60 Z",
                canvas: CGSize(width: 94, height: 116)
            )
            .fill(Color("RoxyHairDeep"))
            .overlay {
                IllustrationPath(
                    instructions: "M 46 29 C 32 13 16 5 6 10 C -2 16 14 32 43 35 L 26 61 L 18 63 L 37 35 Z M 49 30 C 65 8 82 5 86 14 C 89 27 67 36 52 35 L 65 61 L 56 60 Z",
                    canvas: CGSize(width: 94, height: 116)
                )
                .stroke(Color("RoxyInk"), style: StrokeStyle(lineWidth: 1.5, lineJoin: .round))
            }
            IllustrationPath(
                instructions: "M 42 35 C 35 53 32 84 11 104 C 26 107 49 89 53 72 Q 50 98 38 113 C 68 103 66 61 53 35 Z",
                canvas: CGSize(width: 94, height: 116)
            )
            .fill(Color("RoxyHair"))
            .overlay {
                IllustrationPath(
                    instructions: "M 42 35 C 35 53 32 84 11 104 C 26 107 49 89 53 72 Q 50 98 38 113 C 68 103 66 61 53 35 Z",
                    canvas: CGSize(width: 94, height: 116)
                )
                .stroke(Color("RoxyInk"), style: StrokeStyle(lineWidth: 1.5, lineJoin: .round))
            }
            IllustrationPath(
                instructions: "M 46 46 C 44 74 33 89 24 96 M 53 50 Q 63 82 48 102",
                canvas: CGSize(width: 94, height: 116)
            )
            .stroke(Color("RoxyHairLight"), style: StrokeStyle(lineWidth: 1, lineCap: .round))
            RoundedRectangle(cornerRadius: 3)
                .fill(Color("RoxyHairDeep"))
                .frame(width: 12, height: 8)
                .offset(x: 0, y: -22)
        }
        .frame(width: 76, height: 93)
        .rotationEffect(.degrees(angle))
        .position(x: x, y: y)
    }
}

// MARK: - 臉型、皮膚明暗與表情
struct RoxyFace: View {
    var body: some View {
        ZStack {
            PaintedPath("M 184 290 C 167 284 169 317 183 329 L 194 319 Z",
                        Color("RoxySkin"), lineWidth: 1.3)
            PaintedPath("M 345 289 C 364 286 355 320 345 326 L 334 315 Z",
                        Color("RoxySkin"), lineWidth: 1.3)
            PaintedPath(
                "M 187 223 C 218 195 307 193 343 225 C 349 251 350 282 342 318 C 337 346 305 373 274 389 Q 264 394 251 386 C 218 371 192 348 186 319 C 179 285 178 250 187 223 Z",
                Color("RoxySkin"), lineWidth: 1.7, outline: Color("RoxySkinLine")
            )
            PaintedPath(
                "M 189 227 C 217 204 314 201 339 227 L 339 258 C 308 242 295 245 278 263 L 236 255 Q 209 255 188 275 Z",
                Color("RoxySkinShade").opacity(0.55), lineWidth: 0
            )
            PaintedPath(
                "M 189 299 Q 195 339 222 363 L 254 386 Q 223 376 204 355 C 190 340 185 321 184 308 Z",
                Color("RoxySkinShade").opacity(0.44), lineWidth: 0
            )
            RoxyEyes()
            DrawnLine(path: "M 199 274 Q 220 267 242 275 M 288 272 Q 309 265 329 272",
                      color: Color("RoxyHairDeep"), width: 1.8)
            DrawnLine(path: "M 264 320 L 260 331 Q 262 334 266 332",
                      color: Color("RoxySkinLine").opacity(0.7), width: 0.85)
            Ellipse()
                .fill(.white.opacity(0.63))
                .frame(width: 2.3, height: 4)
                .position(x: 267, y: 325)
            DrawnLine(path: "M 254 352 Q 262 349 270 351 Q 273 351 276 349",
                      color: Color("RoxySkinLine"), width: 1.2)
            DrawnLine(path: "M 261 359 Q 267 361 272 358",
                      color: Color("RoxySkinShade").opacity(0.8), width: 0.9)
            Ellipse()
                .fill(Color("RoxyBlush").opacity(0.14))
                .frame(width: 27, height: 9)
                .blur(radius: 2)
                .position(x: 210, y: 333)
            Ellipse()
                .fill(Color("RoxyBlush").opacity(0.14))
                .frame(width: 26, height: 9)
                .blur(radius: 2)
                .position(x: 320, y: 331)
        }
    }
}

// MARK: - 動畫式眼睛：眼白、虹膜漸層、瞳孔、高光、上眼線和下睫毛
private struct RoxyEyes: View {
    private let left = "M 195 296 C 205 287 229 284 246 292 L 249 298 C 243 313 230 320 215 316 C 206 313 200 306 195 296 Z"
    private let right = "M 279 293 C 290 283 316 282 332 291 L 334 296 C 327 311 312 317 298 313 C 290 310 283 302 279 293 Z"

    var body: some View {
        ZStack {
            PaintedPath(left, Color("RoxyEyeWhite"), lineWidth: 1)
            PaintedPath(right, Color("RoxyEyeWhite"), lineWidth: 1)
            ZStack {
                iris(x: 223, y: 299)
                iris(x: 307, y: 297)
            }
            .mask {
                IllustrationPath(instructions: left + " " + right)
            }
            PaintedPath(
                "M 193 294 C 210 283 232 282 249 293 L 252 300 Q 246 296 243 295 C 227 287 207 292 198 297 L 195 302 L 188 295 Z",
                Color("RoxyInk"), lineWidth: 0
            )
            PaintedPath(
                "M 278 291 C 293 280 316 279 333 288 L 340 285 L 337 294 L 332 299 C 317 288 295 286 280 295 Z",
                Color("RoxyInk"), lineWidth: 0
            )
            DrawnLine(path: "M 204 312 Q 221 322 237 314 M 291 309 Q 308 318 323 310",
                      color: Color("RoxySkinLine"), width: 0.85)
            DrawnLine(path: "M 196 294 L 191 290 M 199 292 L 195 287 M 333 289 L 338 284",
                      color: Color("RoxyInk"), width: 1.25)
            DrawnLine(path: "M 197 284 Q 219 278 242 285 M 285 281 Q 307 276 328 281",
                      color: Color("RoxySkinLine").opacity(0.6), width: 0.75)
        }
    }

    private func iris(x: CGFloat, y: CGFloat) -> some View {
        ZStack {
            Ellipse()
                .fill(LinearGradient(
                    colors: [Color("RoxyEyeDeep"), Color("RoxyEye"), Color("RoxyCrystal")],
                    startPoint: .top, endPoint: .bottom
                ))
                .frame(width: 27, height: 33)
                .overlay(Ellipse().stroke(Color("RoxyEyeDeep"), lineWidth: 1.2))
            Ellipse()
                .fill(Color("RoxyEyeDeep"))
                .frame(width: 8.5, height: 21)
                .offset(y: -2)
            Ellipse()
                .fill(Color("RoxyCrystalLight"))
                .frame(width: 16, height: 6)
                .offset(y: 10)
            Ellipse()
                .fill(Color("RoxyEye"))
                .frame(width: 7, height: 4)
                .offset(y: 9)
            Ellipse()
                .fill(.white)
                .frame(width: 7.5, height: 10)
                .rotationEffect(.degrees(-19))
                .offset(x: -6, y: -7)
            Circle()
                .fill(.white.opacity(0.95))
                .frame(width: 3.5)
                .offset(x: 7, y: 4)
        }
        .position(x: x, y: y)
    }
}

// MARK: - 瀏海：偏藍紫的分束髮片、交疊尖端與細髮絲
struct RoxyFringe: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 175 215 Q 204 193 223 203 C 220 243 217 283 232 298 C 207 290 194 265 196 242 C 185 286 190 321 208 344 Q 187 341 176 323 L 163 328 C 177 299 162 252 175 215 Z",
                Color("RoxyHair"), lineWidth: 1.7
            )
            PaintedPath(
                "M 307 202 Q 337 193 350 214 C 350 246 350 264 359 283 L 345 278 C 343 308 332 330 320 340 Q 338 305 329 277 C 325 257 319 234 307 202 Z",
                Color("RoxyHair"), lineWidth: 1.7
            )
            PaintedPath(
                "M 200 208 Q 234 188 260 204 C 255 236 242 256 248 280 C 225 269 219 239 221 217 Q 212 252 212 271 C 201 259 196 240 200 208 Z",
                Color("RoxyHair"), lineWidth: 1.6
            )
            PaintedPath(
                "M 243 199 Q 269 188 293 201 C 290 225 287 247 278 262 Q 266 277 258 289 C 261 267 249 256 248 239 Q 255 261 265 267 C 264 242 243 225 243 199 Z",
                Color("RoxyHair"), lineWidth: 1.6
            )
            PaintedPath(
                "M 285 197 Q 306 188 324 203 C 329 226 335 248 330 267 Q 317 256 311 242 L 307 270 C 292 255 295 222 285 197 Z",
                Color("RoxyHair"), lineWidth: 1.6
            )
            PaintedPath(
                "M 178 223 L 187 219 C 184 258 172 299 188 329 L 178 321 C 169 293 175 260 178 223 Z M 333 218 L 341 222 Q 348 260 342 287 L 334 313 Q 340 257 333 218 Z",
                Color("RoxyHairShadow"), lineWidth: 0
            )
            PaintedPath(
                "M 254 206 Q 257 230 268 245 L 265 256 Q 250 231 249 211 Z M 208 212 L 213 211 Q 210 240 217 252 Q 207 243 208 212 Z M 301 208 L 305 207 Q 314 232 310 244 Q 302 231 301 208 Z",
                Color("RoxyHairLight").opacity(0.68), lineWidth: 0
            )
            DrawnLine(
                path: "M 188 222 C 182 263 179 294 195 326 M 219 212 Q 213 250 226 278 M 255 207 C 251 226 270 247 269 264 M 286 209 Q 280 243 267 273 M 304 208 Q 315 243 308 258 M 338 223 Q 347 270 335 311",
                color: Color("RoxyHairDeep").opacity(0.7), width: 0.8
            )
            DrawnLine(path: "M 184 250 L 182 274 M 341 240 L 344 259",
                      color: Color("RoxyHairLight").opacity(0.9), width: 2.3)
        }
    }
}

// MARK: - 黑色尖帽：彎折的帽尖、帽冠摺線、白色雙邊與金色織帶
struct RoxyHat: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 178 199 C 188 154 200 107 229 71 C 248 45 264 26 287 36 C 324 42 349 88 381 111 L 412 129 C 389 135 363 134 349 125 C 355 148 360 168 363 193 Z",
                Color("RoxyHat"), lineWidth: 2.3
            )
            PaintedPath(
                "M 284 36 C 310 44 329 92 349 118 Q 366 131 397 130 C 371 116 347 96 334 77 Q 310 42 284 36 Z",
                Color("RoxyHatLight"), lineWidth: 0
            )
            PaintedPath(
                "M 255 52 C 224 95 213 134 203 173 L 191 184 C 201 122 219 87 242 63 Z",
                Color("RoxyHatLight").opacity(0.65), lineWidth: 0
            )
            PaintedPath(
                "M 317 73 C 316 88 330 100 332 117 L 325 139 Q 348 130 342 106 C 334 94 324 84 317 73 Z",
                Color("RoxyInk"), lineWidth: 0.9
            )
            DrawnLine(path: "M 317 73 Q 311 83 327 104 M 301 108 L 316 118 M 327 125 L 318 143",
                      color: Color("RoxyInk"), width: 1.8)
            PaintedPath(
                "M 194 158 C 245 145 300 150 354 164 L 358 180 C 300 165 242 161 189 175 Z",
                Color("RoxyPaper"), lineWidth: 1.6
            )
            PaintedPath(
                "M 189 174 C 241 160 303 165 359 180 L 362 195 C 296 180 239 178 184 190 Z",
                Color("RoxyAccent"), lineWidth: 1.5
            )
            PaintedPath(
                "M 185 187 C 241 175 301 180 361 193 L 364 205 C 302 191 237 189 181 202 Z",
                Color("RoxyPaper"), lineWidth: 1.5
            )
            ForEach(0..<15, id: \.self) { index in
                let x = 193 + CGFloat(index) * 11
                let curve = pow((x - 260) / 88, 2) * 7
                Capsule()
                    .fill(Color("RoxyWood"))
                    .frame(width: index.isMultiple(of: 3) ? 2.4 : 1.1,
                           height: index.isMultiple(of: 3) ? 7 : 4)
                    .rotationEffect(.degrees(Double(index - 6) * 1.6))
                    .position(x: x, y: 174 + curve + CGFloat(index) * 0.31)
            }
            brim
        }
    }

    private var brim: some View {
        ZStack {
            PaintedPath(
                "M 181 191 C 146 204 130 219 89 232 L 61 240 Q 58 245 77 250 C 129 261 193 255 240 245 C 302 231 346 234 380 243 C 410 252 452 251 481 240 Q 488 235 472 229 C 425 217 393 190 358 188 C 305 176 240 178 181 191 Z",
                Color("RoxyHat"), lineWidth: 2.2
            )
            PaintedPath(
                "M 67 243 C 139 251 192 241 242 230 C 315 214 378 230 417 239 Q 452 246 480 235 C 455 255 408 251 380 243 C 343 233 296 234 238 246 Q 124 265 67 250 Z",
                Color("RoxyInk"), lineWidth: 0
            )
            DrawnLine(
                path: "M 83 240 C 143 244 190 236 238 224 C 305 208 357 221 393 231",
                color: Color("RoxyHatLight"), width: 1.4
            )
            DrawnLine(path: "M 140 217 Q 206 206 242 198 M 378 214 L 427 234",
                      color: Color("RoxyHatLight").opacity(0.6), width: 0.9)
        }
    }
}

// MARK: - 手：握杖的左手、自然垂下的右手，以及手指關節
struct RoxyHands: View {
    var body: some View {
        ZStack {
            PaintedPath(
                "M 76 501 L 79 483 Q 80 475 88 477 L 97 472 Q 109 469 116 478 Q 121 484 119 491 L 123 496 Q 125 502 119 506 L 121 511 Q 117 520 109 521 L 93 526 Q 81 521 76 513 Z",
                Color("RoxySkin"), lineWidth: 1.6, outline: Color("RoxySkinLine")
            )
            PaintedPath(
                "M 80 506 Q 93 517 114 510 L 119 516 Q 101 534 84 521 Z",
                Color("RoxySkinShade").opacity(0.7), lineWidth: 0
            )
            DrawnLine(path: "M 96 483 Q 109 479 116 486 M 99 492 Q 112 489 120 496 M 99 502 Q 110 500 120 506 M 100 512 Q 111 512 115 516",
                      color: Color("RoxySkinLine").opacity(0.74), width: 0.9)
            PaintedPath(
                "M 82 482 C 86 477 92 482 94 488 L 101 493 Q 105 498 101 502 Q 96 504 89 497 L 83 494 Z",
                Color("RoxySkin"), lineWidth: 1.2, outline: Color("RoxySkinLine")
            )
            DrawnLine(path: "M 96 494 L 99 496", color: Color("RoxyPaper"), width: 2)
            PaintedPath(
                "M 430 570 L 445 583 Q 458 591 467 600 L 483 609 Q 489 613 485 617 Q 481 620 469 614 L 462 611 L 467 640 Q 467 648 462 648 Q 457 646 454 625 L 449 618 L 453 651 Q 453 658 447 657 Q 442 655 439 629 L 436 621 L 438 651 Q 438 659 432 658 L 423 623 L 418 643 Q 414 648 411 642 L 410 611 Q 407 599 414 589 Z",
                Color("RoxySkin"), lineWidth: 1.6, outline: Color("RoxySkinLine")
            )
            PaintedPath(
                "M 435 583 L 446 593 Q 451 608 446 621 L 438 622 Q 440 606 430 600 L 419 603 Q 417 593 425 587 Z",
                Color("RoxySkinShade").opacity(0.6), lineWidth: 0
            )
            DrawnLine(path: "M 422 607 Q 432 611 433 621 M 437 602 Q 443 610 444 614 M 445 595 L 452 601 M 451 620 L 456 622 M 419 618 L 421 626",
                      color: Color("RoxySkinLine").opacity(0.7), width: 0.9)
            DrawnLine(path: "M 447 651 L 450 651 M 433 652 L 436 652 M 462 642 L 465 642",
                      color: Color("RoxyPaper").opacity(0.85), width: 1)
        }
    }
}
