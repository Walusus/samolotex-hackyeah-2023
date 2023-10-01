# notebooks
Ten folder zawiera Jupyter Notebooks z automatycznym przetwarzaniem i wizualizacją udostępnionych w zadaniu danych.

### Dane z USA
Dodatkowo w celu zaprezentowania możliwości analitycznych, przy skalowaniu rozwiązania na poziom krajowy, wykonane zostały analizy i modelowania na analogicznych danych opisujących edukację z Stanów Zjednoczonych Ameryki.
Dane te pochodzą z otwartego zbioru [U.S. Education Datasets: Unification Project
](https://www.kaggle.com/datasets/noriuk/us-education-datasets-unification-project). Rozmiar i obszerność tego zbioru pozwala lepiej zaprezentować możliwości naszego rozwiązania, niż dane jedynie 7 szkół z Kutna.

### Notatniki
`wydatki_dochody_parsing.ipynb` działa bezpośrednio na surowych plikach XML z programu BeSTi@.
Wszystkie dokumenty Rb-27 i Rb-28 są wczytane i przetworzone w taki sposób, aby zapisać je w formacie *csv*.
Dla każdej pozycji zapisywane są jej wartości, wraz z informacją o jednostce, której dotyczą.

`merge_databases.ipynb` korzysta z wstępnie ręcznie przeczyszczonych plików, dostępnych w folderze `data`.
Te pliki, zawierają informacje z Systemu Informacji Oświatowej o:
- ilości uczniów w szkołach i poszczególnych kategoriach
- etatach nauczycielskich

oraz informacje o staninach i subwencjach. 
Pliki te wymagały ręcznej obróbki, ze względu na format w którym zostały dostarczony, natomiast przy innej formie eksportu tych danych, proces także byłby zautomatyzowany.

Notebook sprowadza wszystkie te dane do wspólnego formatu, a następnie łączy je w jedną tabelę, dzięki czemu wszystkie te informacje są dostępne w jednym pliku, pozwalającym na prostą analizę.
Dodatkowo w wydatkach i dochodach normalizowane są nazwy szkół, aby pokrywały się z tymi znajdującymi się w reszcie danych.

`datapane_visualization.ipynb` zawiera kod generujący wizualizację wszystkich danych i analiz, z powyższych punktów, wraz z danymi z USA których przygotowanie można znaleźć w `./usa/`.