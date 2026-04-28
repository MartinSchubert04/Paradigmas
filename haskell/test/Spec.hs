import Test.Hspec
import Library

main :: IO ()
main = hspec $ do
    describe "Test funcion definida por partes" $ do
        it "f -2" $ do
            f (-2) `shouldBe` -1
        it "f -1" $ do
            f (-1) `shouldBe` 1
        it "f 1" $ do
            f 1 `shouldBe` 1
        it "f 2" $ do
            f 2 `shouldBe` -1
