rm ./docs/*.html
rm ./docs/*.zip

for i in ./src/*.md
do
	name="$(basename $i .md)"
	pandoc -i "$i" -f markdown -t html -s -o "./docs/$name.html" --mathjax --css "./static/style.css"
	zip -r ./docs/bundle.zip ./docs
done
