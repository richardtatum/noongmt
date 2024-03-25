export function getHumanReadableDate(date: Date | string) : string {
    return new Date(date).toLocaleDateString("en-GB", {
        day: "numeric",
        weekday: "long",
        month: "long",
        year: "numeric",
    })
}