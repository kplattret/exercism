export function decodedValue(colors: string[]): number {
  const band_colors = [
    "black", "brown", "red", "orange", "yellow",
    "green", "blue", "violet", "grey", "white"
  ]
  const color_indexes = [...colors.slice(0, 2)].map(color => band_colors.indexOf(color))

  return Number(color_indexes.join(''))
}
